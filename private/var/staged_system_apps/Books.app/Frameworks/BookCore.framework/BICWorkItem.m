@implementation BICWorkItem

+ (id)workItemWithPriority:(id)a3 description:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)a1);
  v12 = objc_msgSend(v8, "copy");

  objc_msgSend(v11, "setWorkBlock:", v12);
  objc_msgSend(v11, "setPrioritizer:", v10);

  objc_msgSend(v11, "setWorkDescription:", v9);
  return v11;
}

- (unint64_t)priority
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BICWorkItem prioritizer](self, "prioritizer"));
  v3 = objc_msgSend(v2, "priority");

  return (unint64_t)v3;
}

- (int64_t)compare:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v5 = -[BICWorkItem priority](self, "priority");
  v6 = objc_msgSend(v4, "priority");

  if (v5 < (unint64_t)v6)
    return -1;
  else
    return v5 > (unint64_t)v6;
}

- (void)performWork:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v6 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[BICWorkItem workBlock](self, "workBlock"));
  ((void (**)(_QWORD, id, BICWorkItem *))v5)[2](v5, v6, self);

  objc_autoreleasePoolPop(v4);
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BICWorkItem workDescription](self, "workDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<BICWorkItem %p \"%@\" pri=%lu>"), self, v3, -[BICWorkItem priority](self, "priority")));

  return v4;
}

- (id)workBlock
{
  return self->_workBlock;
}

- (void)setWorkBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BICWorkPriorizing)prioritizer
{
  return self->_prioritizer;
}

- (void)setPrioritizer:(id)a3
{
  objc_storeStrong((id *)&self->_prioritizer, a3);
}

- (NSString)workDescription
{
  return self->_workDescription;
}

- (void)setWorkDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workDescription, 0);
  objc_storeStrong((id *)&self->_prioritizer, 0);
  objc_storeStrong(&self->_workBlock, 0);
}

@end
