@implementation PPCombinedScoreInputSet

- (id)nameForScalarScoreIndex:(unint64_t)a3
{
  id result;
  void *v7;

  if (a3 + 1 < 0x69)
    return off_1E7E1E930[a3 + 1];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPCombinedScoreInputMethods.h"), 224, CFSTR("Value %tu forPPCombinedScoreInputScalar out of range"), a3);

  __break(1u);
  return result;
}

- (unint64_t)minScalarScoreIndex
{
  return 0;
}

- (unint64_t)scalarScoreIndexUpperBound
{
  return 104;
}

- (unint64_t)undefinedScalarScoreIndex
{
  return -1;
}

- (id)nameForArrayScoreIndex:(unint64_t)a3
{
  id result;
  void *v7;

  if (a3 == -1)
    return CFSTR("PPCombinedScoreInputArrayUndefined");
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPCombinedScoreInputMethods.h"), 261, CFSTR("Value %tu forPPCombinedScoreInputArray out of range"), a3);

  __break(1u);
  return result;
}

- (unint64_t)minArrayScoreIndex
{
  return 0;
}

- (unint64_t)arrayScoreIndexUpperBound
{
  return 0;
}

- (unint64_t)undefinedArrayScoreIndex
{
  return -1;
}

- (id)nameForObjectScoreIndex:(unint64_t)a3
{
  id result;
  void *v7;

  if (a3 == -1)
    return CFSTR("PPCombinedScoreInputObjectUndefined");
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPCombinedScoreInputMethods.h"), 298, CFSTR("Value %tu forPPCombinedScoreInputObject out of range"), a3);

  __break(1u);
  return result;
}

- (unint64_t)minObjectScoreIndex
{
  return 0;
}

- (unint64_t)objectScoreIndexUpperBound
{
  return 0;
}

- (unint64_t)undefinedObjectScoreIndex
{
  return -1;
}

@end
