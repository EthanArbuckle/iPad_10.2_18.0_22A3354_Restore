@implementation UISegmentedControlSpringLoadedBehavior

- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;

  v5 = a4;
  objc_msgSend(a3, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "targetItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

  }
  else
  {
    v9 = -1;
  }

  objc_msgSend(v5, "locationInView:", v6);
  v10 = (int)objc_msgSend(v6, "_closestSegmentIndexAtPoint:");
  if (v9 != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTargetItem:", v11);
LABEL_9:
    LOBYTE(v12) = 0;
    goto LABEL_10;
  }
  if ((v10 & 0x80000000) != 0)
  {
    LOBYTE(v12) = 0;
    goto LABEL_11;
  }
  objc_msgSend(v6, "_segmentAtIndex:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isUserInteractionEnabled"))
    goto LABEL_9;
  v12 = objc_msgSend(v11, "isSelected") ^ 1;
LABEL_10:

LABEL_11:
  return v12;
}

@end
