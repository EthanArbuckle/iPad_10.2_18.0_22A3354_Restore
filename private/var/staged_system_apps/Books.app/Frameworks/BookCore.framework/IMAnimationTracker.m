@implementation IMAnimationTracker

- (IMAnimationTracker)initWithCompletion:(id)a3
{
  id v4;
  IMAnimationTracker *v5;
  id v6;
  id completion;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMAnimationTracker;
  v5 = -[IMAnimationTracker init](&v9, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    completion = v5->_completion;
    v5->_completion = v6;

  }
  return v5;
}

+ (id)animationTrackerWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithCompletion:", v4);

  return v5;
}

- (void)addAnimationWithBlock:(id)a3
{
  _QWORD v3[5];

  if (a3)
  {
    ++self->_animationCount;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_58A3C;
    v3[3] = &unk_28D678;
    v3[4] = self;
    (*((void (**)(id, _QWORD *))a3 + 2))(a3, v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
