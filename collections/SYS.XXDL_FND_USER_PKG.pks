SET DEFINE OFF;
Prompt drop Package XXDL_FND_USER_PKG;
DROP PACKAGE XXDL_FND_USER_PKG
/

Prompt Package XXDL_FND_USER_PKG;
--
-- XXDL_FND_USER_PKG  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   XXDL_FND_RESPONSIBILITY_TYPE (Type)
--   XXDL_FND_RESPONSIBILITY_TYPE (Type)
--   XXDL_FND_USERS (Table)
--   STANDARD (Package)
--   XXDL_FND_RESPONSIBILITY_OBJ (Type)
--
/* Formatted on 11/15/2022 6:59:51 PM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE XXDL_FND_USER_PKG
IS
   PROCEDURE POPULATE_DATA;

   FUNCTION GET_RESPONSIBILITY_LIST (P_USER_ID NUMBER)
      RETURN XXDL_FND_RESPONSIBILITY_TYPE;
END XXDL_FND_USER_PKG;
/
SHOW ERRORS;


Prompt drop Package Body XXDL_FND_USER_PKG;
DROP PACKAGE BODY XXDL_FND_USER_PKG
/

Prompt Package Body XXDL_FND_USER_PKG;
--
-- XXDL_FND_USER_PKG  (Package Body) 
--
--  Dependencies: 
--   XXDL_FND_USER_PKG (Package)
--
/* Formatted on 11/15/2022 6:59:51 PM (QP5 v5.287) */
CREATE OR REPLACE PACKAGE BODY XXDL_FND_USER_PKG
IS
   PROCEDURE POPULATE_DATA
   IS
      L_RESPONSIBILITY_REC   XXDL_FND_RESPONSIBILITY_TYPE;
   BEGIN
      L_RESPONSIBILITY_REC :=
         XXDL_FND_RESPONSIBILITY_TYPE (XXDL_FND_RESPONSIBILITY_OBJ (1, 1),
                                       XXDL_FND_RESPONSIBILITY_OBJ (1, 2),
                                       XXDL_FND_RESPONSIBILITY_OBJ (1, 3));



      INSERT INTO XXDL_FND_USERS (USER_ID,
                                  USER_NAME,
                                  EMAIL,
                                  RESPONSIBILITIES_LIST)
           VALUES (1,
                   'demasy',
                   'demasy@demasy.io',
                   L_RESPONSIBILITY_REC);

      COMMIT;
   END POPULATE_DATA;


   FUNCTION GET_RESPONSIBILITY_LIST (P_USER_ID NUMBER)
      RETURN XXDL_FND_RESPONSIBILITY_TYPE
   IS
      L_RESPONSIBILITY_REC           XXDL_FND_RESPONSIBILITY_TYPE;
      L_ANOTHER_RESPONSIBILITY_REC   XXDL_FND_RESPONSIBILITY_TYPE;
   BEGIN
      SELECT XFU.RESPONSIBILITIES_LIST
        INTO L_RESPONSIBILITY_REC
        FROM XXDL_FND_USERS XFU
       WHERE 1 = 1 AND XFU.USER_ID = P_USER_ID;

      L_ANOTHER_RESPONSIBILITY_REC := L_RESPONSIBILITY_REC;

      RETURN L_ANOTHER_RESPONSIBILITY_REC;
   END GET_RESPONSIBILITY_LIST;
END XXDL_FND_USER_PKG;
/
SHOW ERRORS;
