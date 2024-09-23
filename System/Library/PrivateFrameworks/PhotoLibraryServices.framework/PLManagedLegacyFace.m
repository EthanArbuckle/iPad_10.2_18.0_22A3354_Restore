@implementation PLManagedLegacyFace

+ (id)entityName
{
  return CFSTR("LegacyFace");
}

- (CGRect)relativeRect
{
  void *v2;
  void *v3;
  id v4;
  __int128 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __int128 v10;
  __int128 v11;
  CGRect result;

  -[PLManagedLegacyFace relativeRectValue](self, "relativeRectValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (v4 = objc_retainAutorelease(v2),
        !strncmp((const char *)objc_msgSend(v4, "objCType"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0x32uLL)))
  {
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(v4, "getValue:", &v10);
  }
  else
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v10 = *MEMORY[0x1E0C9D628];
    v11 = v5;
  }

  v7 = *((double *)&v10 + 1);
  v6 = *(double *)&v10;
  v9 = *((double *)&v11 + 1);
  v8 = *(double *)&v11;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)setRelativeRect:(CGRect)a3
{
  void *v4;
  CGRect v5;

  v5 = a3;
  if (CGRectIsEmpty(a3))
  {
    -[PLManagedLegacyFace setRelativeRectValue:](self, "setRelativeRectValue:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedLegacyFace setRelativeRectValue:](self, "setRelativeRectValue:", v4, *(_QWORD *)&v5.origin.x, *(_QWORD *)&v5.origin.y, *(_QWORD *)&v5.size.width, *(_QWORD *)&v5.size.height);

  }
}

- (void)delete
{
  id v3;

  -[PLManagedLegacyFace managedObjectContext](self, "managedObjectContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteObject:", self);

}

@end
