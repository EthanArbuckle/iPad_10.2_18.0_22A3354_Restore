@implementation BKSlideTransition

- (BKSlideTransition)initWithDirection:(unint64_t)a3
{
  BKSlideTransition *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKSlideTransition;
  result = -[BKSlideTransition init](&v5, "init");
  if (result)
    result->_direction = a3;
  return result;
}

+ (id)transitionWithDirection:(unint64_t)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithDirection:", a3);
}

- (BKSlideTransition)init
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromSelector("initWithDirection:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Please use the designated initializer -[%@ %@]"), v5, v7);

  return 0;
}

- (double)transitionDuration:(id)a3
{
  return 0.300000012;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  double v19;
  double Width;
  double v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", UITransitionContextFromViewKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", UITransitionContextToViewKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  -[BKSlideTransition transitionDuration:](self, "transitionDuration:", v4);
  v9 = v8;
  if ((id)-[BKSlideTransition direction](self, "direction") == (id)2)
    objc_msgSend(v7, "insertSubview:belowSubview:", v6, v5);
  else
    objc_msgSend(v7, "insertSubview:aboveSubview:", v6, v5);
  objc_msgSend(v5, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = -[BKSlideTransition direction](self, "direction");
  switch(v18)
  {
    case 0uLL:
      v43.origin.x = v11;
      v43.origin.y = v13;
      v43.size.width = v15;
      v43.size.height = v17;
      Width = CGRectGetWidth(v43);
      v44.origin.x = v11;
      v44.origin.y = v13;
      v44.size.width = v15;
      v44.size.height = v17;
      v21 = -CGRectGetWidth(v44);
LABEL_10:
      v19 = v13;
      goto LABEL_13;
    case 1uLL:
      v45.origin.x = v11;
      v45.origin.y = v13;
      v45.size.width = v15;
      v45.size.height = v17;
      Width = -CGRectGetWidth(v45);
      v46.origin.x = v11;
      v46.origin.y = v13;
      v46.size.width = v15;
      v46.size.height = v17;
      v21 = CGRectGetWidth(v46);
      goto LABEL_10;
    case 2uLL:
      v42.origin.x = v11;
      v42.origin.y = v13;
      v42.size.width = v15;
      v42.size.height = v17;
      v19 = v13 + CGRectGetHeight(v42);
      break;
    default:
      v19 = v13;
      break;
  }
  v21 = v11;
  Width = v11;
LABEL_13:
  objc_msgSend(v5, "setFrame:", v11, v13, v15, v17);
  objc_msgSend(v6, "setFrame:", v21, v13, v15, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
  objc_msgSend(v22, "setUserInteractionEnabled:", 0);

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000E5AB8;
  v31[3] = &unk_1008EA970;
  v34 = Width;
  v35 = v19;
  v36 = v15;
  v37 = v17;
  v32 = v5;
  v33 = v6;
  v38 = v11;
  v39 = v13;
  v40 = v15;
  v41 = v17;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000E5AF0;
  v27[3] = &unk_1008E9E68;
  v28 = v32;
  v29 = v7;
  v30 = v4;
  v23 = v4;
  v24 = v7;
  v25 = v32;
  v26 = v6;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v31, v27, v9);

}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

@end
