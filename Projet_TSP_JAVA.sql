PGDMP                      |         	   projetSQL    17.2    17.2 \    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    24772 	   projetSQL    DATABASE     �   CREATE DATABASE "projetSQL" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Chinese (Simplified)_China.936';
    DROP DATABASE "projetSQL";
                     postgres    false            �            1255    33178    check_titulaire_discipline()    FUNCTION     ~  CREATE FUNCTION public.check_titulaire_discipline() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    discipline_count INT;
BEGIN
    SELECT COUNT(*) INTO discipline_count
    FROM Titulaire_Discipline
    WHERE ID = NEW.ID;

    IF discipline_count > 1 THEN
        RAISE EXCEPTION 'A Titulaire cannot have more than 2 Disciplines.';
    END IF;

    RETURN NEW;
END;
$$;
 3   DROP FUNCTION public.check_titulaire_discipline();
       public               postgres    false            �            1259    34922 	   chercheur    TABLE     ;   CREATE TABLE public.chercheur (
    id integer NOT NULL
);
    DROP TABLE public.chercheur;
       public         heap r       postgres    false            �            1259    24774    departement    TABLE     �  CREATE TABLE public.departement (
    departement_code character varying(3) DEFAULT NULL::character varying NOT NULL,
    departement_nom character varying(255) DEFAULT NULL::character varying,
    departement_nom_uppercase character varying(255) DEFAULT NULL::character varying,
    departement_slug character varying(255) DEFAULT NULL::character varying,
    departement_nom_soundex character varying(20) DEFAULT NULL::character varying
);
    DROP TABLE public.departement;
       public         heap r       postgres    false            �            1259    24855    departements    TABLE     A  CREATE TABLE public.departements (
    departement_code character varying(3) NOT NULL,
    departement_nom character varying(255),
    departement_nom_uppercase character varying(255),
    departement_slug character varying(255),
    departement_nom_soundex character varying(20),
    region_code character varying(3)
);
     DROP TABLE public.departements;
       public         heap r       postgres    false            �            1259    24826    departmentsregions    TABLE     �   CREATE TABLE public.departmentsregions (
    id integer NOT NULL,
    region_code character varying(3) NOT NULL,
    code character varying(3) NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL
);
 &   DROP TABLE public.departmentsregions;
       public         heap r       postgres    false            �            1259    24825    departmentsregions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.departmentsregions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.departmentsregions_id_seq;
       public               postgres    false    223            �           0    0    departmentsregions_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.departmentsregions_id_seq OWNED BY public.departmentsregions.id;
          public               postgres    false    222            �            1259    34884 
   discipline    TABLE     e   CREATE TABLE public.discipline (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.discipline;
       public         heap r       postgres    false            �            1259    34883    discipline_id_seq    SEQUENCE     �   CREATE SEQUENCE public.discipline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.discipline_id_seq;
       public               postgres    false    232            �           0    0    discipline_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.discipline_id_seq OWNED BY public.discipline.id;
          public               postgres    false    231            �            1259    34902    etudiant    TABLE     �   CREATE TABLE public.etudiant (
    id integer NOT NULL,
    sujetdethese character varying(255) NOT NULL,
    discipline integer,
    anneedethese integer NOT NULL,
    encadrant integer
);
    DROP TABLE public.etudiant;
       public         heap r       postgres    false            �            1259    24834    info_regions    TABLE     �   CREATE TABLE public.info_regions (
    name character varying(255) NOT NULL,
    cheflieu character varying(255) NOT NULL,
    superficie integer NOT NULL,
    population2024 integer NOT NULL
);
     DROP TABLE public.info_regions;
       public         heap r       postgres    false            �            1259    34932    mcf    TABLE     K   CREATE TABLE public.mcf (
    id integer NOT NULL,
    etudiant integer
);
    DROP TABLE public.mcf;
       public         heap r       postgres    false            �            1259    34877    personne    TABLE     �   CREATE TABLE public.personne (
    id integer NOT NULL,
    nom character varying(50) NOT NULL,
    prenom character varying(50) NOT NULL,
    age integer NOT NULL,
    ville character varying(50) NOT NULL
);
    DROP TABLE public.personne;
       public         heap r       postgres    false            �            1259    34876    personne_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personne_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.personne_id_seq;
       public               postgres    false    230            �           0    0    personne_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.personne_id_seq OWNED BY public.personne.id;
          public               postgres    false    229            �            1259    24841    prefectureidf    TABLE     �   CREATE TABLE public.prefectureidf (
    id character varying(3) NOT NULL,
    namedept character varying(255) NOT NULL,
    nameville character varying(255) NOT NULL,
    nameregion character varying(255) NOT NULL
);
 !   DROP TABLE public.prefectureidf;
       public         heap r       postgres    false            �            1259    24815    regions    TABLE     �   CREATE TABLE public.regions (
    id integer NOT NULL,
    code character varying(3) NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL
);
    DROP TABLE public.regions;
       public         heap r       postgres    false            �            1259    24814    regions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.regions_id_seq;
       public               postgres    false    221            �           0    0    regions_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;
          public               postgres    false    220            �            1259    24870    regionscheflieu    TABLE     �   CREATE TABLE public.regionscheflieu (
    code character varying(3) NOT NULL,
    name character varying(255),
    slug character varying(255),
    ville_id integer,
    superficie integer,
    population2024 integer
);
 #   DROP TABLE public.regionscheflieu;
       public         heap r       postgres    false            �            1259    34892 	   titulaire    TABLE     [   CREATE TABLE public.titulaire (
    id integer NOT NULL,
    numbureau integer NOT NULL
);
    DROP TABLE public.titulaire;
       public         heap r       postgres    false            �            1259    34947    titulaire_discipline    TABLE     j   CREATE TABLE public.titulaire_discipline (
    id integer NOT NULL,
    discipline_id integer NOT NULL
);
 (   DROP TABLE public.titulaire_discipline;
       public         heap r       postgres    false            �            1259    24788    villes_france_free    TABLE       CREATE TABLE public.villes_france_free (
    ville_id integer NOT NULL,
    ville_departement character varying(3) DEFAULT NULL::character varying,
    ville_slug character varying(255) DEFAULT NULL::character varying,
    ville_nom character varying(45) DEFAULT NULL::character varying,
    ville_nom_simple character varying(45) DEFAULT NULL::character varying,
    ville_nom_reel character varying(45) DEFAULT NULL::character varying,
    ville_nom_soundex character varying(20) DEFAULT NULL::character varying,
    ville_nom_metaphone character varying(22) DEFAULT NULL::character varying,
    ville_code_postal character varying(255) DEFAULT NULL::character varying,
    ville_commune character varying(3) DEFAULT NULL::character varying,
    ville_code_commune character varying(5) NOT NULL,
    ville_arrondissement integer,
    ville_canton character varying(4) DEFAULT NULL::character varying,
    ville_amdi integer,
    ville_population_2010 integer,
    ville_population_1999 integer,
    ville_population_2012 integer,
    ville_densite_2010 integer,
    ville_surface double precision,
    ville_longitude_deg double precision,
    ville_latitude_deg double precision,
    ville_longitude_grd character varying(9) DEFAULT NULL::character varying,
    ville_latitude_grd character varying(8) DEFAULT NULL::character varying,
    ville_longitude_dms character varying(9) DEFAULT NULL::character varying,
    ville_latitude_dms character varying(8) DEFAULT NULL::character varying,
    ville_zmin integer,
    ville_zmax integer
);
 &   DROP TABLE public.villes_france_free;
       public         heap r       postgres    false            �            1259    24787    villes_france_free_ville_id_seq    SEQUENCE     �   CREATE SEQUENCE public.villes_france_free_ville_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.villes_france_free_ville_id_seq;
       public               postgres    false    219            �           0    0    villes_france_free_ville_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.villes_france_free_ville_id_seq OWNED BY public.villes_france_free.ville_id;
          public               postgres    false    218            �            1259    24895    villesprefecturesidf    TABLE     �   CREATE TABLE public.villesprefecturesidf (
    ville_id integer NOT NULL,
    departement_code character varying(3),
    region_code character varying(3)
);
 (   DROP TABLE public.villesprefecturesidf;
       public         heap r       postgres    false            �           2604    24829    departmentsregions id    DEFAULT     ~   ALTER TABLE ONLY public.departmentsregions ALTER COLUMN id SET DEFAULT nextval('public.departmentsregions_id_seq'::regclass);
 D   ALTER TABLE public.departmentsregions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    223    223            �           2604    34887    discipline id    DEFAULT     n   ALTER TABLE ONLY public.discipline ALTER COLUMN id SET DEFAULT nextval('public.discipline_id_seq'::regclass);
 <   ALTER TABLE public.discipline ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    232    231    232            �           2604    34880    personne id    DEFAULT     j   ALTER TABLE ONLY public.personne ALTER COLUMN id SET DEFAULT nextval('public.personne_id_seq'::regclass);
 :   ALTER TABLE public.personne ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    230    229    230            �           2604    24818 
   regions id    DEFAULT     h   ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);
 9   ALTER TABLE public.regions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    220    221            �           2604    24791    villes_france_free ville_id    DEFAULT     �   ALTER TABLE ONLY public.villes_france_free ALTER COLUMN ville_id SET DEFAULT nextval('public.villes_france_free_ville_id_seq'::regclass);
 J   ALTER TABLE public.villes_france_free ALTER COLUMN ville_id DROP DEFAULT;
       public               postgres    false    219    218    219            �          0    34922 	   chercheur 
   TABLE DATA           '   COPY public.chercheur (id) FROM stdin;
    public               postgres    false    235   �z       x          0    24774    departement 
   TABLE DATA           �   COPY public.departement (departement_code, departement_nom, departement_nom_uppercase, departement_slug, departement_nom_soundex) FROM stdin;
    public               postgres    false    217   �z       �          0    24855    departements 
   TABLE DATA           �   COPY public.departements (departement_code, departement_nom, departement_nom_uppercase, departement_slug, departement_nom_soundex, region_code) FROM stdin;
    public               postgres    false    226   ΂       ~          0    24826    departmentsregions 
   TABLE DATA           O   COPY public.departmentsregions (id, region_code, code, name, slug) FROM stdin;
    public               postgres    false    223   *�       �          0    34884 
   discipline 
   TABLE DATA           .   COPY public.discipline (id, name) FROM stdin;
    public               postgres    false    232   ��       �          0    34902    etudiant 
   TABLE DATA           Y   COPY public.etudiant (id, sujetdethese, discipline, anneedethese, encadrant) FROM stdin;
    public               postgres    false    234   �                 0    24834    info_regions 
   TABLE DATA           R   COPY public.info_regions (name, cheflieu, superficie, population2024) FROM stdin;
    public               postgres    false    224   <�       �          0    34932    mcf 
   TABLE DATA           +   COPY public.mcf (id, etudiant) FROM stdin;
    public               postgres    false    236   �       �          0    34877    personne 
   TABLE DATA           ?   COPY public.personne (id, nom, prenom, age, ville) FROM stdin;
    public               postgres    false    230   9�       �          0    24841    prefectureidf 
   TABLE DATA           L   COPY public.prefectureidf (id, namedept, nameville, nameregion) FROM stdin;
    public               postgres    false    225   ��       |          0    24815    regions 
   TABLE DATA           7   COPY public.regions (id, code, name, slug) FROM stdin;
    public               postgres    false    221   $�       �          0    24870    regionscheflieu 
   TABLE DATA           a   COPY public.regionscheflieu (code, name, slug, ville_id, superficie, population2024) FROM stdin;
    public               postgres    false    227   Ζ       �          0    34892 	   titulaire 
   TABLE DATA           2   COPY public.titulaire (id, numbureau) FROM stdin;
    public               postgres    false    233   �       �          0    34947    titulaire_discipline 
   TABLE DATA           A   COPY public.titulaire_discipline (id, discipline_id) FROM stdin;
    public               postgres    false    237   	�       z          0    24788    villes_france_free 
   TABLE DATA             COPY public.villes_france_free (ville_id, ville_departement, ville_slug, ville_nom, ville_nom_simple, ville_nom_reel, ville_nom_soundex, ville_nom_metaphone, ville_code_postal, ville_commune, ville_code_commune, ville_arrondissement, ville_canton, ville_amdi, ville_population_2010, ville_population_1999, ville_population_2012, ville_densite_2010, ville_surface, ville_longitude_deg, ville_latitude_deg, ville_longitude_grd, ville_latitude_grd, ville_longitude_dms, ville_latitude_dms, ville_zmin, ville_zmax) FROM stdin;
    public               postgres    false    219   .�       �          0    24895    villesprefecturesidf 
   TABLE DATA           W   COPY public.villesprefecturesidf (ville_id, departement_code, region_code) FROM stdin;
    public               postgres    false    228   
�       �           0    0    departmentsregions_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.departmentsregions_id_seq', 1, false);
          public               postgres    false    222            �           0    0    discipline_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.discipline_id_seq', 1, false);
          public               postgres    false    231            �           0    0    personne_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.personne_id_seq', 2, true);
          public               postgres    false    229            �           0    0    regions_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.regions_id_seq', 1, false);
          public               postgres    false    220            �           0    0    villes_france_free_ville_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.villes_france_free_ville_id_seq', 1, false);
          public               postgres    false    218            �           2606    34926    chercheur chercheur_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.chercheur
    ADD CONSTRAINT chercheur_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.chercheur DROP CONSTRAINT chercheur_pkey;
       public                 postgres    false    235            �           2606    24849    departement departement_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.departement
    ADD CONSTRAINT departement_pkey PRIMARY KEY (departement_code);
 F   ALTER TABLE ONLY public.departement DROP CONSTRAINT departement_pkey;
       public                 postgres    false    217            �           2606    24877    departements departements_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.departements
    ADD CONSTRAINT departements_pkey PRIMARY KEY (departement_code);
 H   ALTER TABLE ONLY public.departements DROP CONSTRAINT departements_pkey;
       public                 postgres    false    226            �           2606    24833 *   departmentsregions departmentsregions_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.departmentsregions
    ADD CONSTRAINT departmentsregions_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.departmentsregions DROP CONSTRAINT departmentsregions_pkey;
       public                 postgres    false    223            �           2606    34891    discipline discipline_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.discipline
    ADD CONSTRAINT discipline_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.discipline DROP CONSTRAINT discipline_name_key;
       public                 postgres    false    232            �           2606    34889    discipline discipline_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.discipline
    ADD CONSTRAINT discipline_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.discipline DROP CONSTRAINT discipline_pkey;
       public                 postgres    false    232            �           2606    34906    etudiant etudiant_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.etudiant
    ADD CONSTRAINT etudiant_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.etudiant DROP CONSTRAINT etudiant_pkey;
       public                 postgres    false    234            �           2606    24840    info_regions info_regions_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.info_regions
    ADD CONSTRAINT info_regions_pkey PRIMARY KEY (name);
 H   ALTER TABLE ONLY public.info_regions DROP CONSTRAINT info_regions_pkey;
       public                 postgres    false    224            �           2606    34936    mcf mcf_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.mcf
    ADD CONSTRAINT mcf_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.mcf DROP CONSTRAINT mcf_pkey;
       public                 postgres    false    236            �           2606    34882    personne personne_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.personne
    ADD CONSTRAINT personne_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.personne DROP CONSTRAINT personne_pkey;
       public                 postgres    false    230            �           2606    24847     prefectureidf prefectureidf_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.prefectureidf
    ADD CONSTRAINT prefectureidf_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.prefectureidf DROP CONSTRAINT prefectureidf_pkey;
       public                 postgres    false    225            �           2606    24824    regions regions_code_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_code_key UNIQUE (code);
 B   ALTER TABLE ONLY public.regions DROP CONSTRAINT regions_code_key;
       public                 postgres    false    221            �           2606    24822    regions regions_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.regions DROP CONSTRAINT regions_pkey;
       public                 postgres    false    221            �           2606    24879 $   regionscheflieu regionscheflieu_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.regionscheflieu
    ADD CONSTRAINT regionscheflieu_pkey PRIMARY KEY (code);
 N   ALTER TABLE ONLY public.regionscheflieu DROP CONSTRAINT regionscheflieu_pkey;
       public                 postgres    false    227            �           2606    34951 .   titulaire_discipline titulaire_discipline_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.titulaire_discipline
    ADD CONSTRAINT titulaire_discipline_pkey PRIMARY KEY (id, discipline_id);
 X   ALTER TABLE ONLY public.titulaire_discipline DROP CONSTRAINT titulaire_discipline_pkey;
       public                 postgres    false    237    237            �           2606    34896    titulaire titulaire_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.titulaire
    ADD CONSTRAINT titulaire_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.titulaire DROP CONSTRAINT titulaire_pkey;
       public                 postgres    false    233            �           2606    24809 *   villes_france_free villes_france_free_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.villes_france_free
    ADD CONSTRAINT villes_france_free_pkey PRIMARY KEY (ville_id);
 T   ALTER TABLE ONLY public.villes_france_free DROP CONSTRAINT villes_france_free_pkey;
       public                 postgres    false    219            �           2606    24811 <   villes_france_free villes_france_free_ville_code_commune_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.villes_france_free
    ADD CONSTRAINT villes_france_free_ville_code_commune_key UNIQUE (ville_code_commune);
 f   ALTER TABLE ONLY public.villes_france_free DROP CONSTRAINT villes_france_free_ville_code_commune_key;
       public                 postgres    false    219            �           2606    24813 4   villes_france_free villes_france_free_ville_slug_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.villes_france_free
    ADD CONSTRAINT villes_france_free_ville_slug_key UNIQUE (ville_slug);
 ^   ALTER TABLE ONLY public.villes_france_free DROP CONSTRAINT villes_france_free_ville_slug_key;
       public                 postgres    false    219            �           2606    24899 .   villesprefecturesidf villesprefecturesidf_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.villesprefecturesidf
    ADD CONSTRAINT villesprefecturesidf_pkey PRIMARY KEY (ville_id);
 X   ALTER TABLE ONLY public.villesprefecturesidf DROP CONSTRAINT villesprefecturesidf_pkey;
       public                 postgres    false    228            �           2620    34962 7   titulaire_discipline check_titulaire_discipline_trigger    TRIGGER     �   CREATE TRIGGER check_titulaire_discipline_trigger BEFORE INSERT OR UPDATE ON public.titulaire_discipline FOR EACH ROW EXECUTE FUNCTION public.check_titulaire_discipline();
 P   DROP TRIGGER check_titulaire_discipline_trigger ON public.titulaire_discipline;
       public               postgres    false    238    237            �           2606    34927    chercheur chercheur_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.chercheur
    ADD CONSTRAINT chercheur_id_fkey FOREIGN KEY (id) REFERENCES public.titulaire(id);
 E   ALTER TABLE ONLY public.chercheur DROP CONSTRAINT chercheur_id_fkey;
       public               postgres    false    4815    235    233            �           2606    34912 !   etudiant etudiant_discipline_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.etudiant
    ADD CONSTRAINT etudiant_discipline_fkey FOREIGN KEY (discipline) REFERENCES public.discipline(id);
 K   ALTER TABLE ONLY public.etudiant DROP CONSTRAINT etudiant_discipline_fkey;
       public               postgres    false    234    232    4813            �           2606    34917     etudiant etudiant_encadrant_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.etudiant
    ADD CONSTRAINT etudiant_encadrant_fkey FOREIGN KEY (encadrant) REFERENCES public.titulaire(id);
 J   ALTER TABLE ONLY public.etudiant DROP CONSTRAINT etudiant_encadrant_fkey;
       public               postgres    false    233    4815    234            �           2606    34907    etudiant etudiant_id_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY public.etudiant
    ADD CONSTRAINT etudiant_id_fkey FOREIGN KEY (id) REFERENCES public.personne(id);
 C   ALTER TABLE ONLY public.etudiant DROP CONSTRAINT etudiant_id_fkey;
       public               postgres    false    234    4809    230            �           2606    24900 (   villesprefecturesidf fk_departement_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.villesprefecturesidf
    ADD CONSTRAINT fk_departement_code FOREIGN KEY (departement_code) REFERENCES public.departements(departement_code);
 R   ALTER TABLE ONLY public.villesprefecturesidf DROP CONSTRAINT fk_departement_code;
       public               postgres    false    226    228    4803            �           2606    24880    regionscheflieu fk_name    FK CONSTRAINT     |   ALTER TABLE ONLY public.regionscheflieu
    ADD CONSTRAINT fk_name FOREIGN KEY (name) REFERENCES public.info_regions(name);
 A   ALTER TABLE ONLY public.regionscheflieu DROP CONSTRAINT fk_name;
       public               postgres    false    224    227    4799            �           2606    24905 #   villesprefecturesidf fk_region_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.villesprefecturesidf
    ADD CONSTRAINT fk_region_code FOREIGN KEY (region_code) REFERENCES public.regions(code);
 M   ALTER TABLE ONLY public.villesprefecturesidf DROP CONSTRAINT fk_region_code;
       public               postgres    false    4793    221    228            �           2606    24890 '   villes_france_free fk_ville_departement    FK CONSTRAINT     �   ALTER TABLE ONLY public.villes_france_free
    ADD CONSTRAINT fk_ville_departement FOREIGN KEY (ville_departement) REFERENCES public.departements(departement_code);
 Q   ALTER TABLE ONLY public.villes_france_free DROP CONSTRAINT fk_ville_departement;
       public               postgres    false    226    219    4803            �           2606    24885    regionscheflieu fk_ville_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.regionscheflieu
    ADD CONSTRAINT fk_ville_id FOREIGN KEY (ville_id) REFERENCES public.villes_france_free(ville_id);
 E   ALTER TABLE ONLY public.regionscheflieu DROP CONSTRAINT fk_ville_id;
       public               postgres    false    219    4787    227            �           2606    34942    mcf mcf_etudiant_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.mcf
    ADD CONSTRAINT mcf_etudiant_fkey FOREIGN KEY (etudiant) REFERENCES public.etudiant(id);
 ?   ALTER TABLE ONLY public.mcf DROP CONSTRAINT mcf_etudiant_fkey;
       public               postgres    false    4817    236    234            �           2606    34937    mcf mcf_id_fkey    FK CONSTRAINT     m   ALTER TABLE ONLY public.mcf
    ADD CONSTRAINT mcf_id_fkey FOREIGN KEY (id) REFERENCES public.titulaire(id);
 9   ALTER TABLE ONLY public.mcf DROP CONSTRAINT mcf_id_fkey;
       public               postgres    false    233    236    4815            �           2606    34957 <   titulaire_discipline titulaire_discipline_discipline_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.titulaire_discipline
    ADD CONSTRAINT titulaire_discipline_discipline_id_fkey FOREIGN KEY (discipline_id) REFERENCES public.discipline(id);
 f   ALTER TABLE ONLY public.titulaire_discipline DROP CONSTRAINT titulaire_discipline_discipline_id_fkey;
       public               postgres    false    4813    232    237            �           2606    34952 1   titulaire_discipline titulaire_discipline_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.titulaire_discipline
    ADD CONSTRAINT titulaire_discipline_id_fkey FOREIGN KEY (id) REFERENCES public.titulaire(id);
 [   ALTER TABLE ONLY public.titulaire_discipline DROP CONSTRAINT titulaire_discipline_id_fkey;
       public               postgres    false    233    4815    237            �           2606    34897    titulaire titulaire_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.titulaire
    ADD CONSTRAINT titulaire_id_fkey FOREIGN KEY (id) REFERENCES public.personne(id);
 E   ALTER TABLE ONLY public.titulaire DROP CONSTRAINT titulaire_id_fkey;
       public               postgres    false    4809    233    230            �      x������ � �      x   �  x�UWM��J^'��WL�_IK$��$�RL����u3A ŴO`�}{�p��2�fEU�YY�W�� �<��)�3�i3��\����em:�X�UUY4�EQ$�;�ӡm~�V��/EK[���E�AJo��+�eچ��l�~*t����Z�_p�~���1���~[F��ӿLx��p�������w�����$���QZ�o|H;���s�S���:�������T���X0�8�Y.���N�e	L��|e%a�m�:ʂ��9ӌy�gl+0de��Bq91�g2�,&#�⣩�c�ĈԸ7\G3,Z���\����h��,�z�� ��7L�V3ĴXڦu^]�S��ڋ����2QlW6`�]^�ϼ|�s,[3\Z��Mq�
Zo�$�g�Lױ4c>A��L�),����h��g�S�\v͒�u��?�'I��/��`����|��rbT�W҃��;�kZ���+�ĺ0U�"�Rx�[�kj�A��7���&�?��b�X3�i
�4�ț���<x�n��9�,��������Ip��/�N�e�_7�����ď7�i� Q�t��<� V)��6X�%����~����OM�%n�)�4�$�BV�js!d����.a�A�Gq��9�p\ˆ�K�\�˶�B��p�Y�*�j�DլmP>�A1ѫ�\k�Y�0k��	�bT��ב�h8�eҦhZ�IJ��bWYmJ�PO��(��q��iٴ�5�����x�(#��"�6��\�XV���\�Fh���{��eذǥ�|�Eý���j���3zs�����G�;�ZP؊C�T�Y����D�YK������!��߲��3�rܵ����S����¶��� )/>���2���[��r5�$e��R�1�.�W�R(*���-l[iѽ�t�.�B��`d�yt���%�)�L!;��L�0_���i|�1���[��T)�L�$����W�u�%ή��툽m/iǱ�EpǙp����U��ŝ�����=?,��΄��fsf^�g���"s��+�*���n�*ͱ��#(z��	������i�r��ĸ]�U�9ۊ��8�R7��������U�"�
���Үn�˷�L�k�p���}��y֜9M��'�{ӆ���r^�=^�#\y.�𻳤=�����,+��;��@q�jY�=�A1�&f_ղb��&=�2E���tC���x�0���{xxlSs-z�|0ݗ��xxb_���9q}���?��׹���Д�P������w��lǙx�
��.:�$�;�V7��|u�8Y�2 �ޛc�������0���ޘ�	=��9�����
�K���Ai����.�\�a3��S�-�ieQ�\��:�9��PI�z�SY��j��67H�n娠�z��S�rnB��p��Ԏsjn�y�Kf㐙jǳ�ܞ��h� G�1��2��LK$�dͯ�ܥ��V1Fi��d��Z�N#Q*��|>HqK�+)�_i��U�!u�9��t-��'էc�<�~L<Z�6_�_\���R���?��J����P䖩-f���lX�ck՚C�0(��� �d�ŷ0�|ߏqߐ��?vd�IO^Xt�:z	]������Rq:z�u�-�:Q�t��	�O���턟�S���8/\:�� ����밓K̇8���<����bAǺ}�w�q��îÎ��bIOr�'��Z�)�eE�sn~:�VE�w�t�	Ҁ��|Z��8ɨ���u�G��!���Җm+��4�ӊqϿqK��H��<�{I�<��	�U\��(��5d]�ǭ���ܐx)^����ksR�t��h���X�Jڣ�*e����hK�.%� =]�����6��e�g��:y��,�gO�yX�El.�����~�����Y��j���/��QOޞj'�Bˀ��XJ`y�і��;��.�#����\�Om����^Xۿ��i�� ߜ��      �   L  x�UWMr�J^'��W�@��RXj���$ �/f#=[�H@����>D��o����̒�l���ˬ���ئ�>R����<��7;8��:I֎?&��]
��j)L�$Ω4;/Pf�/Ug�+kY�O���6����C\XQl-��&��l��qA����َk�����}y�%�I���W��Jqp
O`�Y�m}��@T%Va�l�8��:X��5wN(l�ןϯ�&����P��Wr���xʠ�xd�<��k;��,�`����J��,��x8c�#{L��	��4Y��xm8�gJ�^�c偯.�{��}��1���~o�@\�7gh������g[���Z���n~����C`ۣ��p)�MG�a������ĳag:�}���� �z����w=����k�V�SE��0�כ�����wi��ɀ�6��|��D ;N�L!A�'��*��(1���m�?��#��뷿 '�#��c���7����^���.�����E�;���(f�+۷�ޅ��p�hh.�4 �9.ݷչåy�-����*x5��y�#�,��\�Nz�P�F���f;/ ����rE��7l��0ھmx���΄�s[Q��c�d%F����P��d�M�
7V�%� �rJ�z�ՙ���Xw��O����bs���iŇ>^/o�]š֝��"�H,���80� ��o	]��F����u����AZ #�EV�+��F�R��0C�i/=�$�⋪�h����d��ҢI�H ���ML#���_my>������tC�J=<W���Ĳ���r\Q���wI�
S��KO�\��ٞ�jr����:��k]��8Ɲ(�w�A��4�ޡ�g|�N)�ğI!��;�c�h�wg�ǹ-�mҿe%�3ycJK��4�=
:��3��M�
_*iʊ�B��C��M袋�j�J��i�T�*D�@u��.�{*�
OP�T��l�Z�
o�?����A�,���`vpR���O�"�k҆�L����ބ��m}����c��>�R>�k
Ư�4�K\qh��/R���ъ����+��/��T5ŊM�����#w�U����fv�V��=29_3U�\@Е����
Q�+Pͮ�%ʲ/x�޹-B�#�I4�1�c}<Z���^E�U�U��(@���f�q����֣��zr��R:a,ۙ'11�U�>կ�P���2\��p�q�sʟ�p{e�w<4�5���\���`�c]������h��Mkp:ʊ#S�����5�b��bS�V�،�����
�C)s�1�2ze�BKƠF_��lh(�������I���#sE��(e�}��վx���^��x�2 B�����;�]C���w��ǯ[l�r���Cr?�}���^W_�0x�*�ap����u��$���V��	Q(Ȟʛ��_1��a�|�!�	'��8��T�V�8�S�K� gd+3M����z26�R��T)B�j�te����șؤЏ�V�GF�GF�Tm�:`�� g����C�M\�/M��]�0]w���t��^W���*���J@�����hۣI@Eŵg折+�0�uBƸBf8��db�H!QF.Rc���e����Sz�T�����]�&<��'蚎�fU��Z��0Ʀx�Ol8�1I1����(�0���h�X�lŚ���ĝڴ�"��rt�'.bm���3���/�`�'��K���]�Ӆ���a(�z8>?�����}ʕ�2�p�3ʧ]u�#i�Z҄�m����5��j���DJ����Y��	��p0Xñtm�V�)����e�����)��=�#����ut��iS���O��Ӽ:�ݴ'��9�#�S����,��i�r{�f۳Q�X�Mq��-qQȝU��Z��L;�P	:y�TW	:y�P;�b*u$�f����dE�]�:�"0
�X��W�����]y`��0�5�/J��y}��|幓�!w�L�����QL�r_����0��l��9����P6f���������,���ͩ|ӎ�1����#�}�,Rw�α�G����X��z�N���O=�T��As:�d�m62螇�q0��?F��� ����      ~   x  x��W�r�6>O�۞ܱ��c~v�ۉ��z'��酱�DYr)ɭ�}�&�}�X?����z!)|@*�2�EDgMG��8�$�E����D9	��mc�8�*�E
�����?�i��[��l����g��=�|�r�T/#�sU'�3��\y��4��H����ͅ���3W^�O���=��(�]'�a�9-* ���Q4�h9Z�ڳ�B4EBE{6�"�!�U�����p��9Jd�h��	�������<x�%�z���ΌR�KB{aڝ����a�Q&B{a�Ѵ ��(�"#�O��n���
��t�։s�G%�0_��SĪG��Wt�;wxy���r����8�����?�@����wq�P{��p�6�'`�F>0l�	]8;��C �.{W��pQ�̙����r�N�s�t��W�z���"�'gɢaQUߊhn��u�8�fv���`���>5]3���>�Њ��*8gV�p5�����S��B)�>x�J��;S'5�]!��'5 �����'��b��n�G4���( W8��G�s�)7�χWg�v$����?�_�V]p״�Ԗ|�v����_�>h��D��
��ч�Ur  ԁ� �K5^��<9C���4� �6X�@�v��2@�.�h8�m�C�2Ռ�_��T�I𣇼!�,�{���lĄc����I�i�k�<u��B<��n��,�xx�d���K5��|�?�O��Y��-tE-��o���G�H���$�m�c���ӝH�2�W�q����AQЖf/9z�s��fJK܉�I����Р�ɒ6^�Y��L�2�Y!�-{w�<��6a��&]N6��*��� ������8_H����:4�G"p�������l��扲b�5Zw�HQ�hk�ڬ��s�Po���.5yl��pjI!y&g���^�ë�S�����JQzr��I����{,aG5�5�����ʍ�������s�!ϱ��O(��ؔÀ�J�R'��L��b���(_i�H̇��(�ce0ʈ����T� -�)�WF��t\���̮oD,���U�8��he��I�-�5����r�d�|����T�"�$��x�D�ރ�RZI�w�m��.25�v�k�ҨD���l��C�U��H˥&r@�0�h�Դ@D����3D��%��q\�3�;3�[�a�0�2o�pg�aCx7�r-�@���;���л;���G��w������Js6��潮�Ҩ��:x\3'�̹mz7��齗r����qԖ�=˳�OWz[��tyz]��EUhI8���8�����X��	W���u�X�ǿ3���_i|����N��9�*��[!�&S۶�����!W���+�;L�xHٜ�\U���W��t�+^�yW�k3�zx���������!�<l+�s?��������XF~��xe�:��i[��n�*�� h'A���rG����ڽ�Z��z�~����
V�YS�Ʌ�0:�U2�<O��g�ك3���^����k�b�<L�ӯ�k��O�8u��<	T v����iuh��i+R{�$�*��P?��.I�8��=����I�*�JT*:��j�_��vk݈�h�d}��o?1��      �   I   x�3��u�p�����\F��~n�AP>�1��kp����	�K��g�)g������kp�����PO� �y�      �   !   x�3�.�J-qI�J,K�4�4�4����� Z��         �  x�M�=r�0���)ԥb�PRr���=�� �M� ��|��C�o��e9�L�޾�-����!b�{�����g�`{LZo� '��R�u��!-�����M:������N��^X��:c	���H~�J�@i�8Ym0����0�z\mӐn�8�B�@ya�i�B���!�ke���]Q�~�m*pWr�~/��X��:�ξ�Z��?'F�㈠��-�Uc��?InC&�I_-�o�N�@���*F��sJI˭�������%�z�r�����j���HvC%J��s��*5�DF�g��8-H�p�rb!|��I"#[�H��+R؏]5�����ҽ�?�:�Ԝ��qBqUC�4�i��3��V�Z�3Ԓ��!/�2��	��J{/5܄�Yp�(Z�7����|�q��pG Js��pJ�58g,�4�JA
zH�K��률�������       �      x������ � �      �   D   x�3�L)��JM��41�H,�,�2��(���4������I�2�L*(/�4���M,*N���qqq 8h      �   �   x��4�t-.���K�<�YVT�y�/'U7%U׭(1/9��҈�#���$��	T旘W�ZT���Ҙ�@7813�D�%5/���)?)3=�Tΰ���ob�L��+KR3s0ԙBԩ�g�r���h�b���� �GE      |   �  x�MQ�r�0�_��3�T��)���"U����� 5�|D�ý��?�))np{����;�T�i�un8�7(2���c��@8ܠȑ�\u�6V� 
���|?k�E���	��;�]���Ja��Q�P�赭	�#ِ�=e�BV`C6xJ~�.*��xB=q�4s]��Y�{7����KÖ��;��oWa�ݒ�Y �B����6�`�H�y��z�m̿8�	�O�4��O�� T�2Ë>O�y���b��r�9�=���vB�Jv6���������LI}��*Q-��k�-O�H���\��R^��ú;R}a�o�:�BUX�x��D<��3ٌ���r��3x/�\�k��fE�%V|/�{�P|�Za��2�~�`N�O����x�-y�w��Y� �ůoB�]��6      �     x�MRKr�0]��Ю+w�ߥ�i�E�f�[3���Rf�C����X!)��!�G��vH�ܔ�a{��g@G��Pi�����~2쯐��G�����,UO�+N�P�A`�(Z�1p������֥�&U]�������z��v��������5L:jT�p����&/�w�]g��\mr�4�X���d5�h"7e�e۾_��Ū���+<~$�
�\�%��3�H�=F%��n��M��� �!F��f��{�?��?��ϟ:%��c�6������v�a;�,����A����,�}:M�ԻRw�@3�y�F�Gr��7]�H���l\�w�)ӵ��oE���{�<�}��Q���%��|�`�ߡ�Hy��k!��P� �o=��JQ��K�ٍ�y؝�d[6�|����]�5MA
(
\@,�Q:��]y�b�|u�:���-�,��ss��Jc�#���`1-�F��3������Yk)�?_�R�?C��      �      x�3�440����� 
      �      x�3�4�2�4����� ��      z   �  x��X�nG}.~����ޏ�D�)�R��"/��
d2 � �?�O�w����R��!�q�{�{x�.���/I�Dֿ���v2y?���^��OW�~X
΍�͉s��*����R��|M�1��֤���]	9JԮ�����Ĝj��#'�R��=�����$����o�������Nn����� c�y��H/5�����ˁ+�^@̋MS�)|KH�b�Ib�B���Rƿ"1v��q�KZ�OC����D?*k����o��\^�_�O�}r�z?�����U�Z�s\���Y�*0�O��:� I�.(������r�_�6&`Ս|�Jn��$f��j$�}�i������a4L�ٰV�& ��D��~���a�X"��N�W`W��&1u%Ul)5Hr�&g����X��%�y�(I���Ǎ̮g��i<��'̄�s��`0�7,� �� ۧf(����n5�(��*'�0��:g�O��t~u�}�29.x>%%ᗥ�����q��d�Ϧ���u����2l��x�嘆@����_��`'\�S�."4�F�6.G�V�IΰB�%EW��>�4�\a�o���A��|>]�̎d����VH�B�9�6�ݻ���E^��C*�^p�X�l9k�*s�G�rG��J��2.��G�h	>��_>����r�O���������iw,\���,�85���P�B�Ǭ'o\rhH&_���x��C��$�H:#�	/g1�ρqT4X���6�������|�����x�����/���E��0&�lX�a#�3��j{����U۫�Wm��^���{�䨺�hy�� nr���L����R�vH�h֨Y�@��g�� vA$��#�g��e�{�l�_�N���~�%tO�49�sb8��k ��	��k��l�vTB��@q�&�
�-�P�.C�"�1N��$GQET�vϏ���FV����v9}s�e���o��j�Z���,�_������:�Us�C$��Z;|�1�С�4$d2�t��2k���9���v�}BZ�'�r�4;^P�d>_AC�iHTCoLt���R�jl.�\p|�F̩SK�D����(��<ԑ�����G�u�� _����d�f�/�&�o��r�/gBs���a4L�ٰV�FD"m��^��j{��Z�'�ƫwjr���P�3zb�@AE�z�.�̒:�XQC��Wu�����BC�9"�s*x5��y}8l�O��~#��r:^M�~:�w�okV��#c>B���\�l���Q~�#Г���rCs�T�fK2���-,��?x1����i|���_o�6r��W�������/���������q��q��D�&W�ju�b��&�fɧU��	U@��ǱR'�a�bT]�P��*,�`ƻ�W��|bIz���L�s���~�)���!�t���͡�h5X,A�\�?�w#.�~��
[H�rr=��������������~#K[t9,B����W+3�V?�������¢���̡ET��1Ó�1s���K�
�������ѻ#�%h�0P���h�<RqKMH
�����+�A=�`��BT�FS��R*����3G�C�oc���6�e�V#�C�		4�e��`�N�m:
�1t�U;��<�N7&35/+� 
���uo9b��9"�X1#{p"�(:a�?4E�������Y4d�E�R�����x��y�f�/�������w�כ����oｎXnnV�D��l�Ht�4)���O�wp.;q����w���DIG�����1����l"��G�����My8��D�
<;��b(e��pV!Gv�(�H�n�1��V/�z��2Q��j+^��C��'����@��@eƏ�$�	�	��K@E�v0B0߰�c��X����cOB��A�fJ���1E��3U���� d+�0��(M�#��,��̋���u%PH=��%��ʜ��9����3?I}1����ϻ��n��|~������teh��SN����E��ȇ�5kg!Z�d�EYV^��@������>����L"����'��+4������AFa�Яf�^t5��<��<��AÞ)�S;�.R��)����Jt���3i�Ⱥ���B��H���>���}\�W�kt��w^<~ds��������\�_�Gl)v��QQ�Ǟ��@ JhPٻ�C�P�e�s7��O���      �   6   x�-��� ��3GbL�]��P�D=Yp"3(s����<���{���E�`�
V     