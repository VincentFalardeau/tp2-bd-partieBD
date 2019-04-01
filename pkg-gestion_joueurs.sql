create or replace PACKAGE GESTION_JOUEURS AS 

  TYPE JOUEUR_ENR IS REF CURSOR;
    
  function LISTER return JOUEUR_ENR;
  
  procedure INSERTION(
    pAlias in joueurs2.alias%type,
    pNom in joueurs2.nom%type,
    pPrenom in joueurs2.prenom%type);
    
  FUNCTION GETSCORE( pAlias in joueurs2.alias%type) RETURN JOUEUR_ENR;
  
  PROCEDURE SUPPRIMER(pAlias in joueurs2.alias%type);

END GESTION_JOUEURS;




create or replace PACKAGE BODY GESTION_JOUEURS AS

  function LISTER return JOUEUR_ENR AS
  LISTE JOUEUR_ENR;
  BEGIN
    OPEN LISTE FOR SELECT * FROM JOUEURS2;
    RETURN LISTE;
  END LISTER;

  procedure INSERTION(
    pAlias in joueurs2.alias%type,
    pNom in joueurs2.nom%type,
    pPrenom in joueurs2.prenom%type) AS
  BEGIN
    INSERT INTO JOUEURS2 VALUES(pAlias, pNom, pPrenom);
    commit;
  END INSERTION;
  
  FUNCTION GETSCORE(pAlias in joueurs2.alias%type) 
  RETURN JOUEUR_ENR AS
  SCOREJ JOUEUR_ENR;
  BEGIN
    OPEN SCOREJ FOR SELECT count(*) from scores where alias = palias and score >= 5;
    return scorej;
  END;
    
  PROCEDURE SUPPRIMER(pAlias in joueurs2.alias%type) as
  begin
    delete from scores where alias = palias;
    delete from joueurs2 where alias = palias;
    commit;
  end;
  
  

END GESTION_JOUEURS;