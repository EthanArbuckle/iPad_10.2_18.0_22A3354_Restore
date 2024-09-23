@implementation ODDNodePoint

- (void)setType:(int)a3
{
  uint64_t v3;
  objc_super v5;

  v3 = *(_QWORD *)&a3;
  if (a3 >= 3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODDException"), CFSTR("Bad point type"));
  v5.receiver = self;
  v5.super_class = (Class)ODDNodePoint;
  -[ODDPoint setType:](&v5, sel_setType_, v3);
}

- (void)addChild:(id)a3 order:(unint64_t)a4
{
  id *v6;
  id WeakRetained;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *mChildren;
  NSMutableArray *v11;

  v6 = (id *)a3;
  WeakRetained = objc_loadWeakRetained(v6 + 6);

  if (WeakRetained)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODDException"), CFSTR("Point already has a parent"));
  objc_storeWeak(v6 + 6, self);
  v8 = self->mChildren;
  v11 = v8;
  objc_msgSend((id)objc_opt_class(), "addConnectionToPoint:order:array:", v6, a4, &v11);
  v9 = v11;

  mChildren = self->mChildren;
  self->mChildren = v9;

}

- (void)setParentTransition:(id)a3
{
  ODDTransitionPoint *v4;
  ODDTransitionPoint *mParentTransition;

  v4 = (ODDTransitionPoint *)a3;
  if (self->mParentTransition)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODDException"), CFSTR("Point already has a parent transition"));
  if (-[ODDPoint type](v4, "type") != 3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODDException"), CFSTR("Not a parent transition"));
  mParentTransition = self->mParentTransition;
  self->mParentTransition = v4;

}

- (void)setSiblingTransition:(id)a3
{
  ODDTransitionPoint *v4;
  ODDTransitionPoint *mSiblingTransition;

  v4 = (ODDTransitionPoint *)a3;
  if (self->mSiblingTransition)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODDException"), CFSTR("Point already has a sibling transition"));
  if (-[ODDPoint type](v4, "type") != 5)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODDException"), CFSTR("Not a sibling transition"));
  mSiblingTransition = self->mSiblingTransition;
  self->mSiblingTransition = v4;

}

- (id)children
{
  return self->mChildren;
}

- (id)parent
{
  return objc_loadWeakRetained((id *)&self->mParent);
}

- (id)siblingTransition
{
  return self->mSiblingTransition;
}

- (id)parentTransition
{
  return self->mParentTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSiblingTransition, 0);
  objc_storeStrong((id *)&self->mParentTransition, 0);
  objc_storeStrong((id *)&self->mChildren, 0);
  objc_destroyWeak((id *)&self->mParent);
}

@end
