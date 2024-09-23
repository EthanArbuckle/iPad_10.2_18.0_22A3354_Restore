@implementation CarPanButton

+ (id)arrowImageForDirection:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  else
    return (id)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", off_1011BF718[a3 - 1], UIFontTextStyleSubheadline, v3, v4));
}

- (CarPanButton)initWithDirection:(int64_t)a3
{
  id v5;
  void *v6;
  CarPanButton *v7;
  CarPanButton *v8;
  void *v9;
  uint64_t v10;
  UILongPressGestureRecognizer *v11;
  UILongPressGestureRecognizer *longPressRecognizer;
  UILongPressGestureRecognizer *v13;
  UILongPressGestureRecognizer *physicalLongPressRecognizer;
  UITapGestureRecognizer *v15;
  UITapGestureRecognizer *tapRecognizer;
  UITapGestureRecognizer *v17;
  UITapGestureRecognizer *physicalTapRecognizer;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  _QWORD v32[4];

  v5 = objc_msgSend((id)objc_opt_class(self), "arrowImageForDirection:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v30.receiver = self;
  v30.super_class = (Class)CarPanButton;
  v7 = -[CarFocusableImageButton initWithImage:](&v30, "initWithImage:", v6);
  v8 = v7;
  if (v7)
  {
    v7->_direction = a3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButton axIdentifierForDirection:](v7, "axIdentifierForDirection:", a3));
    -[CarPanButton setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", v9);

    if ((unint64_t)(a3 - 3) >= 2)
      v10 = 0;
    else
      v10 = 3;
    -[CarFocusableImageButton setSemanticContentAttributeForImage:](v8, "setSemanticContentAttributeForImage:", v10);
    v11 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", v8, "handleLongPress:");
    longPressRecognizer = v8->_longPressRecognizer;
    v8->_longPressRecognizer = v11;

    -[UILongPressGestureRecognizer setCancelsTouchesInView:](v8->_longPressRecognizer, "setCancelsTouchesInView:", 0);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v8->_longPressRecognizer, "setMinimumPressDuration:", 0.25);
    v13 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", v8, "handleLongPress:");
    physicalLongPressRecognizer = v8->_physicalLongPressRecognizer;
    v8->_physicalLongPressRecognizer = v13;

    -[UILongPressGestureRecognizer setAllowedPressTypes:](v8->_physicalLongPressRecognizer, "setAllowedPressTypes:", &off_101273A40);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v8->_physicalLongPressRecognizer, "setMinimumPressDuration:", 0.25);
    v15 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v8, "handleTap:");
    tapRecognizer = v8->_tapRecognizer;
    v8->_tapRecognizer = v15;

    -[UITapGestureRecognizer setCancelsTouchesInView:](v8->_tapRecognizer, "setCancelsTouchesInView:", 0);
    -[UITapGestureRecognizer requireGestureRecognizerToFail:](v8->_tapRecognizer, "requireGestureRecognizerToFail:", v8->_longPressRecognizer);
    v17 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v8, "handleTap:");
    physicalTapRecognizer = v8->_physicalTapRecognizer;
    v8->_physicalTapRecognizer = v17;

    -[UITapGestureRecognizer setAllowedPressTypes:](v8->_physicalTapRecognizer, "setAllowedPressTypes:", &off_101273A58);
    -[UITapGestureRecognizer requireGestureRecognizerToFail:](v8->_physicalTapRecognizer, "requireGestureRecognizerToFail:", v8->_physicalLongPressRecognizer);
    -[UITapGestureRecognizer setDelegate:](v8->_physicalTapRecognizer, "setDelegate:", v8);
    v32[0] = v8->_longPressRecognizer;
    v32[1] = v8->_tapRecognizer;
    v32[2] = v8->_physicalLongPressRecognizer;
    v32[3] = v8->_physicalTapRecognizer;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v24, "setAllowedTouchTypes:", &off_101273A70, (_QWORD)v26);
          -[CarPanButton addGestureRecognizer:](v8, "addGestureRecognizer:", v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v21);
    }

  }
  return v8;
}

- (void)handleLongPress:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "state") == (id)1)
  {
    v4 = 0x2000000;
LABEL_6:
    -[CarPanButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", v4);
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "state") == (id)3 || objc_msgSend(v5, "state") == (id)4)
  {
    v4 = 0x4000000;
    goto LABEL_6;
  }
LABEL_7:

}

- (void)handleTap:(id)a3
{
  if (objc_msgSend(a3, "state") == (id)3)
    -[CarPanButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x1000000);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 28.0;
  v4 = 28.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CarPanButton direction](self, "direction")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; direction=%@>"),
                   v3,
                   self,
                   v4));

  return (NSString *)v5;
}

- (id)axIdentifierForDirection:(int64_t)a3
{
  const __CFString *v3;

  if ((unint64_t)(a3 - 1) > 3)
    v3 = &stru_1011EB268;
  else
    v3 = off_1011BF738[a3 - 1];
  return objc_msgSend(CFSTR("CarPanButton."), "stringByAppendingString:", v3);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UILongPressGestureRecognizer *v4;
  UILongPressGestureRecognizer *v5;
  BOOL v6;
  objc_super v8;

  v4 = (UILongPressGestureRecognizer *)a3;
  v5 = v4;
  if (self->_longPressRecognizer == v4 || (UILongPressGestureRecognizer *)self->_tapRecognizer == v4)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CarPanButton;
    v6 = -[CarPanButton gestureRecognizerShouldBegin:](&v8, "gestureRecognizerShouldBegin:", v4);
  }

  return v6;
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  id result;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];

  switch(-[CarPanButton direction](self, "direction"))
  {
    case 1:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CarPlay_Up"), CFSTR("localized string not found"), 0));
      v10[0] = v3;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CarPlay_Pan_Up"), CFSTR("localized string not found"), 0));
      v10[1] = v5;
      v6 = v10;
      goto LABEL_7;
    case 2:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CarPlay_Down"), CFSTR("localized string not found"), 0));
      v9[0] = v3;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CarPlay_Pan_Down"), CFSTR("localized string not found"), 0));
      v9[1] = v5;
      v6 = v9;
      goto LABEL_7;
    case 3:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CarPlay_Left"), CFSTR("localized string not found"), 0));
      v12[0] = v3;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CarPlay_Pan_Left"), CFSTR("localized string not found"), 0));
      v12[1] = v5;
      v6 = v12;
      goto LABEL_7;
    case 4:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CarPlay_Right"), CFSTR("localized string not found"), 0));
      v11[0] = v3;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CarPlay_Pan_Right"), CFSTR("localized string not found"), 0));
      v11[1] = v5;
      v6 = v11;
LABEL_7:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));

      result = v8;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalTapRecognizer, 0);
  objc_storeStrong((id *)&self->_physicalLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
}

@end
