// To parse this JSON data, do
//
//     final covid = covidFromJson(jsonString);

import 'dart:convert';

Covid covidFromJson(String str) => Covid.fromJson(json.decode(str));

String covidToJson(Covid data) => json.encode(data.toJson());

class Covid {
    Covid({
        this.covidGet,
        this.parameters,
        this.errors,
        this.results,
        this.response,
    });

    String covidGet;
    List<dynamic> parameters;
    List<dynamic> errors;
    int results;
    List<Responses> response;

    factory Covid.fromJson(Map<String, dynamic> json) => Covid(
        covidGet: json["get"],
        parameters: List<dynamic>.from(json["parameters"].map((x) => x)),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        response: List<Responses>.from(json["response"].map((x) => Responses.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "get": covidGet,
        "parameters": List<dynamic>.from(parameters.map((x) => x)),
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "results": results,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
    };
}

class Responses {
    Responses({
        this.continent,
        this.country,
        this.population,
        this.cases,
        this.deaths,
        this.tests,
        this.day,
        this.time,
    });

    Continent continent;
    String country;
    int population;
    Cases cases;
    Deaths deaths;
    Tests tests;
    DateTime day;
    DateTime time;

    factory Responses.fromJson(Map<String, dynamic> json) => Responses(
        continent: json["continent"] == null ? null : continentValues.map[json["continent"]],
        country: json["country"],
        population: json["population"] == null ? null : json["population"],
        cases: Cases.fromJson(json["cases"]),
        deaths: Deaths.fromJson(json["deaths"]),
        tests: Tests.fromJson(json["tests"]),
        day: DateTime.parse(json["day"]),
        time: DateTime.parse(json["time"]),
    );

    Map<String, dynamic> toJson() => {
        "continent": continent == null ? null : continentValues.reverse[continent],
        "country": country,
        "population": population == null ? null : population,
        "cases": cases.toJson(),
        "deaths": deaths.toJson(),
        "tests": tests.toJson(),
        "day": "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
        "time": time.toIso8601String(),
    };
}

class Cases {
    Cases({
        this.casesNew,
        this.active,
        this.critical,
        this.recovered,
        this.the1MPop,
        this.total,
    });

    String casesNew;
    int active;
    int critical;
    int recovered;
    String the1MPop;
    int total;

    factory Cases.fromJson(Map<String, dynamic> json) => Cases(
        casesNew: json["new"] == null ? null : json["new"],
        active: json["active"] == null ? null : json["active"],
        critical: json["critical"] == null ? null : json["critical"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        the1MPop: json["1M_pop"] == null ? null : json["1M_pop"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "new": casesNew == null ? null : casesNew,
        "active": active == null ? null : active,
        "critical": critical == null ? null : critical,
        "recovered": recovered == null ? null : recovered,
        "1M_pop": the1MPop == null ? null : the1MPop,
        "total": total,
    };
}

enum Continent { EUROPE, AFRICA, NORTH_AMERICA, SOUTH_AMERICA, ASIA, OCEANIA, ALL }

final continentValues = EnumValues({
    "Africa": Continent.AFRICA,
    "All": Continent.ALL,
    "Asia": Continent.ASIA,
    "Europe": Continent.EUROPE,
    "North-America": Continent.NORTH_AMERICA,
    "Oceania": Continent.OCEANIA,
    "South-America": Continent.SOUTH_AMERICA
});

class Deaths {
    Deaths({
        this.deathsNew,
        this.the1MPop,
        this.total,
    });

    String deathsNew;
    String the1MPop;
    int total;

    factory Deaths.fromJson(Map<String, dynamic> json) => Deaths(
        deathsNew: json["new"] == null ? null : json["new"],
        the1MPop: json["1M_pop"] == null ? null : json["1M_pop"],
        total: json["total"] == null ? null : json["total"],
    );

    Map<String, dynamic> toJson() => {
        "new": deathsNew == null ? null : deathsNew,
        "1M_pop": the1MPop == null ? null : the1MPop,
        "total": total == null ? null : total,
    };
}

class Tests {
    Tests({
        this.the1MPop,
        this.total,
    });

    String the1MPop;
    int total;

    factory Tests.fromJson(Map<String, dynamic> json) => Tests(
        the1MPop: json["1M_pop"] == null ? null : json["1M_pop"],
        total: json["total"] == null ? null : json["total"],
    );

    Map<String, dynamic> toJson() => {
        "1M_pop": the1MPop == null ? null : the1MPop,
        "total": total == null ? null : total,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
