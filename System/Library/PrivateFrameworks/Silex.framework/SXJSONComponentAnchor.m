@implementation SXJSONComponentAnchor

- (int64_t)originAnchorPositionWithValue:(id)a3 withType:(int)a4
{
  if (a3)
    return -[SXJSONComponentAnchor anchorAlignmentForString:](self, "anchorAlignmentForString:", a3, *(_QWORD *)&a4);
  else
    return -[SXJSONComponentAnchor targetAnchorPosition](self, "targetAnchorPosition", 0, *(_QWORD *)&a4);
}

- (int64_t)anchorAlignmentForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("top")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bottom")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("center")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
