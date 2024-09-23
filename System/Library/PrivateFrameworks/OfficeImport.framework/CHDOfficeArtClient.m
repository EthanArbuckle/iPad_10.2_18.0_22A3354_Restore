@implementation CHDOfficeArtClient

- (void)setAnchor:(id)a3
{
  objc_storeStrong((id *)&self->mAnchor, a3);
}

- (id)anchor
{
  return self->mAnchor;
}

- (BOOL)hasBounds
{
  return 0;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAnchor, 0);
}

@end
