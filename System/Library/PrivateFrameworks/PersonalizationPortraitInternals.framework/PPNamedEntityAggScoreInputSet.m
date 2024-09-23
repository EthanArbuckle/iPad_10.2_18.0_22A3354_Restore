@implementation PPNamedEntityAggScoreInputSet

- (id)nameForScalarScoreIndex:(unint64_t)a3
{
  id result;
  void *v7;

  if (a3 + 1 < 0x1A)
    return off_1E7E17D98[a3 + 1];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPNamedEntityAggScoreInputMethods.h"), 66, CFSTR("Value %tu forPPNamedEntityAggScoreInputScalar out of range"), a3);

  __break(1u);
  return result;
}

- (unint64_t)minScalarScoreIndex
{
  return 0;
}

- (unint64_t)scalarScoreIndexUpperBound
{
  return 25;
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
    return CFSTR("PPNamedEntityAggScoreInputArrayUndefined");
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPNamedEntityAggScoreInputMethods.h"), 103, CFSTR("Value %tu forPPNamedEntityAggScoreInputArray out of range"), a3);

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

  if (a3 + 1 < 0xE)
    return off_1E7E17E68[a3 + 1];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPNamedEntityAggScoreInputMethods.h"), 166, CFSTR("Value %tu forPPNamedEntityAggScoreInputObject out of range"), a3);

  __break(1u);
  return result;
}

- (unint64_t)minObjectScoreIndex
{
  return 0;
}

- (unint64_t)objectScoreIndexUpperBound
{
  return 13;
}

- (unint64_t)undefinedObjectScoreIndex
{
  return -1;
}

@end
