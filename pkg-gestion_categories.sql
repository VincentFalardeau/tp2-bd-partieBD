create or replace PACKAGE GESTION_CATEGORIES AS 

  TYPE CATEGORIE_ENR IS REF CURSOR;
  
  FUNCTION LISTER RETURN CATEGORIE_ENR;
  
  FUNCTION aQuestionNonPosee(PCODECAT IN CATEGORIES.CODECATEGORIE%TYPE) RETURN CATEGORIE_ENR;
  
  FUNCTION EST_GAGNEE(PCODECAT IN CATEGORIES.CODECATEGORIE%TYPE)RETURN CATEGORIE_ENR;

END GESTION_CATEGORIES;

create or replace PACKAGE BODY GESTION_CATEGORIES AS

  FUNCTION LISTER RETURN CATEGORIE_ENR AS
  LISTE CATEGORIE_ENR;
  BEGIN
    OPEN LISTE FOR SELECT * FROM CATEGORIES;
    RETURN LISTE;
  END LISTER;
  
  function aQuestionNonPosee(pcodecat in categories.codecategorie%type) return CATEGORIE_ENR as
  bool CATEGORIE_ENR;
  begin
    open bool for select posee from questions where posee = 'n' and codecategorie = pcodecat;
    return bool;
  end;
  
  FUNCTION EST_GAGNEE(PCODECAT IN CATEGORIES.CODECATEGORIE%TYPE)RETURN CATEGORIE_ENR AS
  bool CATEGORIE_ENR;
  begin
    OPEN BOOL FOR SELECT SCORE FROM SCORES WHERE SCORE >= 5 AND CODECATEGORIE = PCODECAT;
    return bool;
  end;

END GESTION_CATEGORIES;