@implementation SpringGroupAnimation

- (void)runWithDuration:(double)a3 delay:(double)a4 options:(unint64_t)a5 mass:(double)a6 stiffness:(double)a7 damping:(double)a8 initialVelocity:(double)a9
{
  id v17;
  NSObject *v18;
  SpringGroupAnimation *v19;
  SpringGroupAnimation *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t buf[4];
  __CFString *v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;

  if (!-[GroupAnimation isAnimated](self, "isAnimated"))
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100AA474C;
    v27[3] = &unk_1011AC860;
    v27[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v27);
    return;
  }
  v17 = sub_100AA2AFC();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = self;
    v20 = v19;
    if (!v19)
    {
      v26 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v21 = (objc_class *)objc_opt_class(v19);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if ((objc_opt_respondsToSelector(v20, "accessibilityIdentifier") & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SpringGroupAnimation performSelector:](v20, "performSelector:", "accessibilityIdentifier"));
      v25 = v24;
      if (v24 && !objc_msgSend(v24, "isEqualToString:", v23))
      {
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v23, v20, v25));

        goto LABEL_9;
      }

    }
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v23, v20));
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138545154;
    v31 = v26;
    v32 = 2048;
    v33 = a3;
    v34 = 2048;
    v35 = a4;
    v36 = 2048;
    v37 = a5;
    v38 = 2048;
    v39 = a6;
    v40 = 2048;
    v41 = a7;
    v42 = 2048;
    v43 = a8;
    v44 = 2048;
    v45 = a9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[%{public}@] runWithDuration:%#.1lfs delay:%#.1lf options:%lu mass:%lf stiffness:%lf damping:%lf initialVelocity:%lf", buf, 0x52u);

  }
  -[GroupAnimation prepare](self, "prepare");
  v28[4] = self;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100AA4738;
  v29[3] = &unk_1011AC860;
  v29[4] = self;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100AA4740;
  v28[3] = &unk_1011AE8F8;
  +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", a5, v29, v28, a3, a4, a6, a7, a8, a9);
}

- (void)runWithDuration:(double)a3 delay:(double)a4 options:(unint64_t)a5
{
  -[SpringGroupAnimation runWithDuration:delay:options:mass:stiffness:damping:initialVelocity:](self, "runWithDuration:delay:options:mass:stiffness:damping:initialVelocity:", a5, a3, 0.0, 1.0, 300.0, 30.0, 0.0);
}

@end
