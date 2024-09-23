@implementation PPTopicAggScoreInputSet

- (id)nameForScalarScoreIndex:(unint64_t)a3
{
  id result;
  void *v7;

  if (a3 + 1 < 0x19)
    return off_1E7E152B0[a3 + 1];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPTopicAggScoreInputMethods.h"), 64, CFSTR("Value %tu forPPTopicAggScoreInputScalar out of range"), a3);

  __break(1u);
  return result;
}

- (unint64_t)minScalarScoreIndex
{
  return 0;
}

- (unint64_t)scalarScoreIndexUpperBound
{
  return 24;
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
    return CFSTR("PPTopicAggScoreInputArrayUndefined");
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPTopicAggScoreInputMethods.h"), 101, CFSTR("Value %tu forPPTopicAggScoreInputArray out of range"), a3);

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
    return off_1E7E15378[a3 + 1];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPTopicAggScoreInputMethods.h"), 162, CFSTR("Value %tu forPPTopicAggScoreInputObject out of range"), a3);

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
