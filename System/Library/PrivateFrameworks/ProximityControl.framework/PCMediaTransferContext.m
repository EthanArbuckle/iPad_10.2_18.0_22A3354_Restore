@implementation PCMediaTransferContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCMediaTransferContext)initWithCoder:(id)a3
{
  PCMediaTransferContext *v3;
  PCMediaTransferContext *v4;
  PCMediaTransferContext *v5;

  v3 = -[PCMediaTransferContext init](self, "init", a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

@end
