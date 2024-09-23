@implementation UITextItemInteractionInteraction

+ (BOOL)mightResponderHaveTextItemInteractions:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EDFC7CA0))
  {
    if ((objc_msgSend(v3, "_mightHaveInteractableItems") & 1) == 0)
    {
LABEL_7:
      v4 = 0;
      goto LABEL_8;
    }
  }
  else if (!objc_msgSend(v3, "conformsToProtocol:", &unk_1EE0300B0)
         || (objc_msgSend(v3, "mightHaveLinks") & 1) == 0)
  {
    goto LABEL_7;
  }
  v4 = 1;
LABEL_8:

  return v4;
}

- (BOOL)_allowItemInteractions
{
  return 0;
}

+ (BOOL)mightResponder:(id)a3 haveInteractableTextItemAtPoint:(CGPoint)a4 precision:(unint64_t)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  char v11;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  if (!objc_msgSend(a1, "mightResponderHaveTextItemInteractions:", v9))
    goto LABEL_6;
  if (!objc_msgSend(v9, "conformsToProtocol:", &unk_1EDFC7CA0))
  {
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE0300B0))
    {
      v11 = objc_msgSend(v9, "willInteractWithLinkAtPoint:", x, y);
      goto LABEL_7;
    }
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v9, "_textInteractableItemAtPoint:precision:", a5, x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 != 0;

LABEL_7:
  return v11;
}

@end
