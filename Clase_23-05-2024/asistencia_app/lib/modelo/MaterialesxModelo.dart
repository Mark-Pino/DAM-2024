
import 'package:asistencia_app/modelo/ActividadModelo.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MaterialesxModelo {
  MaterialesxModelo({
    required this.id,
    required this.cui,
    required this.tipoCui,
    required this.materEntre,
    required this.fecha,
    required this.horaReg,
    required this.latituda,
    required this.longituda,
    required this.modFh,
    required this.offlinex,
    required this.actividadId,
  });
  late final int id;
  late final String cui;
  late final String tipoCui;
  late final String materEntre;
  late final String fecha;
  late final String horaReg;
  late final String latituda;
  late final String longituda;
  late final String modFh;
  late final String offlinex;
  late final int actividadId;
  MaterialesxModelo.unlaunched();

  MaterialesxModelo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    cui = json['cui'];
    tipoCui = json['tipoCui'];
    materEntre = json['materEntre'];
    fecha = json['fecha'];
    horaReg = json['horaReg'];
    latituda = json['latituda'];
    longituda = json['longituda'];
    modFh = json['modFh'];
    offlinex = json['offlinex'];
    actividadId = json['actividadId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['cui'] = cui;
    data['tipoCui'] = tipoCui;
    data['materEntre'] = materEntre;
    data['fecha'] = fecha;
    data['horaReg'] = horaReg;
    data['latituda'] = latituda;
    data['longituda'] = longituda;
    data['modFh'] = modFh;
    data['offlinex'] = offlinex;
    data['actividadId'] = actividadId;
    return data;
  }
}

class MaterialesxRepModelo {
  MaterialesxRepModelo({
    required this.id,
    required this.cui,
    required this.tipoCui,
    required this.materEntre,
    required this.fecha,
    required this.horaReg,
    required this.latituda,
    required this.longituda,
    required this.modFh,
    required this.offlinex,
    required this.actividadId,
  });
  late final int id;
  late final String cui;
  late final String tipoCui;
  late final String materEntre;
  late final String fecha;
  late final String horaReg;
  late final String latituda;
  late final String longituda;
  late final String modFh;
  late final String offlinex;
  late final ActividadModelo actividadId;



  MaterialesxRepModelo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    cui = json['cui'];
    tipoCui = json['tipoCui'];
    materEntre = json['materEntre'];
    fecha = json['fecha'];
    horaReg = json['horaReg'];
    latituda = json['latituda'];
    longituda = json['longituda'];
    modFh = json['modFh'];
    offlinex = json['offlinex'];
    actividadId = ActividadModelo.fromJson(json['actividadId']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['cui'] = cui;
    data['tipoCui'] = tipoCui;
    data['materEntre'] = materEntre;
    data['fecha'] = fecha;
    data['horaReg'] = horaReg;
    data['latituda'] = latituda;
    data['longituda'] = longituda;
    data['modFh'] = modFh;
    data['offlinex'] = offlinex;
    data['actividadId'] = actividadId.toJson();
    return data;
  }
}