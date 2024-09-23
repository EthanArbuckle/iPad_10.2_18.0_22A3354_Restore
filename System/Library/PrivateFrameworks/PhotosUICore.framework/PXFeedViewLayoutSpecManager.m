@implementation PXFeedViewLayoutSpecManager

- (PXFeedViewLayoutSpec)spec
{
  PXFeedViewLayoutSpec *spec;
  void *v6;

  spec = self->_spec;
  if (!spec)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedViewLayoutSpecManager.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_spec != nil"));

    spec = self->_spec;
  }
  return spec;
}

- (void)setSpec:(id)a3
{
  PXFeedViewLayoutSpec *v5;
  char v6;
  PXFeedViewLayoutSpec *v7;

  v7 = (PXFeedViewLayoutSpec *)a3;
  v5 = self->_spec;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXFeedViewLayoutSpec isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_spec, a3);
      -[PXFeedViewLayoutSpecManager signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spec, 0);
}

@end
