class Food {
    
    final String id;
    final String imagePath;
    final String name;
    final String description;
    final double price;


    Food(this.id, this.imagePath, this.name, this.description, this.price);
}

List<Food> mainMenu = [
    Food("01", "chis_burgi.png", "chis amburgui", "Delicioso hamburguer feito de carne de monstro moída pelos deuses do Hagnarok com salada dos jardins de Éden e um queijo polengue diferenciado.", 7.50),
    Food("02", "chis_valeta.png", "chis valeta", "Famigerado X-tudo, tudo mesmo, com direito a restos da valeta das grelhas das forjas dos anões eruditas.  (Não acompanha a batata da imagem)", 2.50),
    Food("03", "chis_ratao.png", "chis ratão", "Lanche apreciado pelos transeuntes das estradas da vida, com carne embalsamada nos templos budistas, todos os embutidos apreciados pelos nórdicos e um pão que não foi feito pelos elfos, aproveitamos a viagem e pegamos a saladas dos jardins de Éden pra fazer esse tembém.", 1.50),
    Food("04", "cotovelo_de_porco.png", "cotovelada de porco", "Não é feito com os cotovelos de um nobre suíno, porém é um suculento hamburguer de carne de porco entre duas gloriosas fatias de pão (esse é pão élfico).", 1.50),
];

List<Food> sideMenu = [
    Food("11", "coxinha_dos_kapiao.png", "cochinha dus kapiao", "Coxinha de galinha criadas nos campos idealizados pelos bucólicos que vivem a utopia da paz dos campos. (Fritamos ela para não ter mais crises existenciais)", 1.42),
    Food("12", "frango_suspeito.png", "frango suspeito", "Frango suspeito de altos delitos, feitos com partes suspeitas do mesmo frango. (frita para não correr o risco de ser suspeito em outras situações)", 5.76),
    Food("13", "rato_voador.png", "rato voador", "Feito com a parte que o frango suspeito usava para voar. (frito para não alçar novos voos)", 85.90),
];

List<Food> dessertMenu = [
    Food("21", "frape_canela_de_veio.png", "frape de canela de veio", "Leite batido com gelo e canela de velho.", 5.90),
    Food("22", "compesadao.png", "compensadao", "Lata de leite condenado, mentira só uma mistura láctea para as tardes trevosas.", 8.72),
];

List<Food> drinkMenu = [
    Food("31", "coca.png", "Coca", "Latinha que pode ser reaproveitada para diversos usos de 275 mL", 25.99),
    Food("32", "guorana.png", "Guoaraná", "Feito com os zoio de curumim, lata de 333 mL", 8.99),
    Food("33", "sucus.png", "Sucuzin", "Qualquer fruta que tá sobrando na dispensa batido, com casca memo, a quantidade varea", 90.88),
    Food("34", "ceva.png", "Ceva", "Bavaria, 350ml de pura perdição, se contente.", 3.90),
];
