import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<ReturnType, Param> {
  Future<Either<Failure, ReturnType>> call([Param param]);
}

class NoParam {}
