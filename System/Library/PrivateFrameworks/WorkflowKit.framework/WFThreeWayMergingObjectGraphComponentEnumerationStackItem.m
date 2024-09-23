@implementation WFThreeWayMergingObjectGraphComponentEnumerationStackItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vertex, 0);
}

- (_QWORD)initWithVertex:(uint64_t)a3 step:(uint64_t)a4 predecessorIndex:
{
  id v8;
  void *v9;
  id v10;
  void *v12;
  objc_super v13;

  v8 = a2;
  v9 = v8;
  if (a1)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithVertex_step_predecessorIndex_, a1, CFSTR("WFThreeWayMergingObjectGraph.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vertex"));

    }
    v13.receiver = a1;
    v13.super_class = (Class)WFThreeWayMergingObjectGraphComponentEnumerationStackItem;
    v10 = objc_msgSendSuper2(&v13, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong((id *)v10 + 1, a2);
      a1[2] = a3;
      a1[3] = a4;
    }
  }

  return a1;
}

+ (_QWORD)initialItemWithVertex:(uint64_t)a1
{
  id v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = a2;
  v3 = objc_alloc((Class)objc_opt_self());
  v4 = -[WFThreeWayMergingObjectGraphComponentEnumerationStackItem initWithVertex:step:predecessorIndex:](v3, v2, 0, 0);

  return v4;
}

@end
