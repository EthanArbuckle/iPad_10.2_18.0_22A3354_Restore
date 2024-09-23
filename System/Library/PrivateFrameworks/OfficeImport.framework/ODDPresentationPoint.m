@implementation ODDPresentationPoint

- (void)setType:(int)a3
{
  uint64_t v3;
  objc_super v5;

  v3 = *(_QWORD *)&a3;
  if (a3 != 4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODDException"), CFSTR("Bad point type"));
  v5.receiver = self;
  v5.super_class = (Class)ODDPresentationPoint;
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
  WeakRetained = objc_loadWeakRetained(v6 + 5);

  if (WeakRetained)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODDException"), CFSTR("Point already has a parent"));
  objc_storeWeak(v6 + 5, self);
  v8 = self->mChildren;
  v11 = v8;
  objc_msgSend((id)objc_opt_class(), "addConnectionToPoint:order:array:", v6, a4, &v11);
  v9 = v11;

  mChildren = self->mChildren;
  self->mChildren = v9;

}

- (id)parent
{
  return objc_loadWeakRetained((id *)&self->mParent);
}

- (id)children
{
  return self->mChildren;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mChildren, 0);
  objc_destroyWeak((id *)&self->mParent);
}

@end
