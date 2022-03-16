part of 'jadwal_bloc.dart';

abstract class JadwalState extends Equatable {
  const JadwalState();

  @override
  List<Object> get props => [];
}

class JadwalInitial extends JadwalState {}

class JadwalSucces extends JadwalState {
  final JadwalModel jadwal;
  const JadwalSucces(this.jadwal);
}

class JadwalError extends JadwalState {
  final String error;
  const JadwalError(this.error);
}

class JadwalLoading extends JadwalState {}
