@implementation ICNoteResultsCollaboratorsBadgeView

- (double)dimension
{
  double v3;
  void *v4;

  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) != 0)
    return 44.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCollaboratorsBadgeView traitCollection](self, "traitCollection"));
  if (objc_msgSend(v4, "ic_hasCompactSize"))
    v3 = 24.0;
  else
    v3 = 32.0;

  return v3;
}

- (CGSize)shadowOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 2.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)shadowRadius
{
  return 4.0;
}

- (double)spacing
{
  double v3;
  void *v4;

  v3 = -28.0;
  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCollaboratorsBadgeView traitCollection](self, "traitCollection"));
    if (objc_msgSend(v4, "ic_hasCompactSize"))
      v3 = -12.0;
    else
      v3 = -16.0;

  }
  return v3;
}

@end
