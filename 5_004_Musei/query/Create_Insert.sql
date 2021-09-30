DROP TABLE Personaggio,Opera,Museo,Artista;

CREATE TABLE Museo (
 NomeM VARCHAR(20) PRIMARY KEY,
 Citta VARCHAR(20) NOT NULL
)

CREATE TABLE Artista (
 NomeA VARCHAR(20) PRIMARY KEY,
 Nazionalita VARCHAR(20) NOT NULL
)

CREATE TABLE Opera (
 Codice INT PRIMARY KEY IDENTITY,
 Titolo VARCHAR(20) NOT NULL,
 NomeM VARCHAR(20) NOT NULL,
 NomeA VARCHAR(20) NOT NULL,
 FOREIGN KEY (NomeM) REFERENCES Museo(NomeM),
 FOREIGN KEY (NomeA) REFERENCES Artista(NomeA)
)

CREATE TABLE Personaggio (
 Personaggio VARCHAR(20) PRIMARY KEY,
 Codice INT,
 FOREIGN KEY (Codice) REFERENCES Opera(Codice)
)

INSERT INTO Museo VALUES
('Museo1','IT'),
('Museo2','FR'),
('Museo3', 'DE');

INSERT INTO Artista VALUES
('Artista1','IT'),
('Artista2','FR'),
('Artista3', 'DE');
INSERT INTO Opera VALUES
('Film1','Museo1','Artista1'),
('Film2','Museo2','Artista2'),
('Film3','Museo3','Artista3');

INSERT INTO Personaggio VALUES 
('Dante',1),
('Dama con ermellino',2),
('Gioconda',2);

