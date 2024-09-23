@implementation PPLocationAggScoreInputSet

- (id)nameForScalarScoreIndex:(unint64_t)a3
{
  id result;
  void *v7;

  if (a3 + 1 < 0x1A)
    return off_1E7E1F8E8[a3 + 1];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocationAggScoreInputMethods.h"), 66, CFSTR("Value %tu forPPLocationAggScoreInputScalar out of range"), a3);

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
    return CFSTR("PPLocationAggScoreInputArrayUndefined");
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocationAggScoreInputMethods.h"), 103, CFSTR("Value %tu forPPLocationAggScoreInputArray out of range"), a3);

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

  if (a3 + 1 < 0xD)
    return off_1E7E1F9B8[a3 + 1];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocationAggScoreInputMethods.h"), 164, CFSTR("Value %tu forPPLocationAggScoreInputObject out of range"), a3);

  __break(1u);
  return result;
}

- (unint64_t)minObjectScoreIndex
{
  return 0;
}

- (unint64_t)objectScoreIndexUpperBound
{
  return 12;
}

- (unint64_t)undefinedObjectScoreIndex
{
  return -1;
}

@end
