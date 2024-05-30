from utils.database import getconnection

def getallafleveringen():
    with getconnection() as conn:
        query = """
            SELECT aflevering.aflTitel, aflevering.duur, seizoen.jaar, seizoen.IMDBRating, serie.serietitel, serie.IMDBLink, genre.GenreNaam  FROM aflevering
            left join seizoen on aflevering.SeizID = seizoen.SeizoenID
            left join serie on seizoen.SerieID = serie.serieID
            left join serie_genre on serie.serieID = serie_genre.serieID
            left join genre on serie_genre.genreID = genre.genreID
            """
        cursor = conn.cursor()
        cursor.execute(query)
        result = cursor.fetchall()
        print (result)
        return result

def getafleveringbyID(afleveringID):
    with getconnection() as conn:
        cursor = conn.cursor()
        query = """
            SELECT aflevering.aflTitel, aflevering.duur, seizoen.jaar, seizoen.IMDBRating, serie.serietitel, serie.IMDBLink, genre.GenreNaam  FROM aflevering
            left join seizoen on aflevering.SeizID = seizoen.SeizoenID
            left join serie on seizoen.SerieID = serie.serieID
            left join serie_genre on serie.serieID = serie_genre.serieID
            left join genre on serie_genre.genreID = genre.genreID
            where aflevering.afleveringID = %s
            """
        
        cursor.execute(query, (afleveringID,))
        result = cursor.fetchall()
        print (result)
        return result
    
def getseries():
    with getconnection() as conn:
        cursor = conn.cursor()
        query = """
                SELECT 
                    serie.SerieTitel,
                    serie.IMDBLink,
                    GROUP_CONCAT(genre.Genrenaam SEPARATOR ', ') AS Genres
                FROM 
                    serie
                LEFT JOIN 
                    serie_genre ON serie_genre.SerieID = serie.SerieID
                LEFT JOIN 
                    genre ON genre.GenreID = serie_genre.GenreID
                GROUP BY 
                    serie.SerieID, serie.SerieTitel, serie.IMDBLink
                ORDER BY 
                    serie.SerieID ASC;
            """
        cursor.execute(query)
        result = cursor.fetchall()
        print (result)
        return result
    
def getseriesByID(serieID):
    with getconnection() as conn:
        cursor = conn.cursor()
        query = """
                SELECT 
                    serie.SerieTitel,
                    serie.IMDBLink,
                    GROUP_CONCAT(genre.Genrenaam SEPARATOR ', ') AS Genres
                FROM 
                    serie
                LEFT JOIN 
                    serie_genre ON serie_genre.SerieID = serie.SerieID
                LEFT JOIN 
                    genre ON genre.GenreID = serie_genre.GenreID
                WHERE 
                    serie.SerieID = %s
                GROUP BY 
                    serie.SerieID, serie.SerieTitel, serie.IMDBLink
                LIMIT 1;
            """
        cursor.execute(query, (serieID, ))
        result = cursor.fetchall()
        print (result)
        return result

