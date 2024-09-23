@implementation TUIElementAnimationGroupPhase

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIAnimationPhaseBuilding;
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2CB710 != -1)
    dispatch_once(&qword_2CB710, &stru_241500);
  return (id)qword_2CB708;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementAnimationGroupPhaseBuilder, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementAnimationGroupPhaseBuilder, a2);
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;
  id v10;

  var0 = a4.var0;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "setRunList:", objc_msgSend(v8, "animationReferenceForAttribute:node:", 180, var0));
  objc_msgSend(v8, "floatForAttribute:withDefault:node:", 66, var0, NAN);
  objc_msgSend(v9, "setDelay:");
  objc_msgSend(v8, "floatForAttribute:withDefault:node:", 69, var0, NAN);
  objc_msgSend(v9, "setDuration:");
  objc_msgSend(v9, "setOptions:", objc_msgSend(v8, "animationCalculationModeAndCurveForNode:", var0));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 138, var0));

  objc_msgSend(v9, "setName:", v10);
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  TUIAnimationGroupPhase *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instantiateAnimationReference:", objc_msgSend(v12, "runList")));

  if (objc_msgSend(v9, "count"))
  {
    v10 = objc_alloc_init(TUIAnimationGroupPhase);
    objc_msgSend(v12, "delay");
    -[TUIAnimationGroupPhase setDelay:](v10, "setDelay:");
    objc_msgSend(v12, "duration");
    -[TUIAnimationGroupPhase setDuration:](v10, "setDuration:");
    -[TUIAnimationGroupPhase setOptions:](v10, "setOptions:", -[TUIAnimationGroupPhase options](v10, "options") | (unint64_t)objc_msgSend(v12, "options"));
    -[TUIAnimationGroupPhase setAnimations:](v10, "setAnimations:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
    objc_msgSend(v7, "addAnimationGroupPhase:withName:", v10, v11);

  }
}

@end
