@implementation _SBSystemApertureRepresentationSuppressionAssertion

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationBlock, 0);
}

- (void)invalidate
{
  void (**invalidationBlock)(id, _SBSystemApertureRepresentationSuppressionAssertion *);
  id v4;

  -[_SBSystemApertureRepresentationSuppressionAssertion _setValid:](self, "_setValid:", 0);
  invalidationBlock = (void (**)(id, _SBSystemApertureRepresentationSuppressionAssertion *))self->_invalidationBlock;
  if (invalidationBlock)
  {
    invalidationBlock[2](invalidationBlock, self);
    v4 = self->_invalidationBlock;
    self->_invalidationBlock = 0;

  }
}

- (BOOL)suppressForSystemChromeSuppression
{
  return self->_suppressForSystemChromeSuppression;
}

- (BOOL)isProximityReaderVisible
{
  return self->_proximityReaderVisible;
}

- (BOOL)isLiquidDetectionVisible
{
  return self->_liquidDetectionVisible;
}

- (BOOL)isCoverSheetVisible
{
  return self->_coverSheetVisible;
}

- (_SBSystemApertureRepresentationSuppressionAssertion)initWithCoverSheetVisible:(BOOL)a3 liquidDetectionVisible:(BOOL)a4 proximityReaderVisible:(BOOL)a5 suppressForSystemChromeSuppression:(BOOL)a6 invalidationBlock:(id)a7
{
  id v12;
  _SBSystemApertureRepresentationSuppressionAssertion *v13;
  _SBSystemApertureRepresentationSuppressionAssertion *v14;
  uint64_t v15;
  id invalidationBlock;
  objc_super v18;

  v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)_SBSystemApertureRepresentationSuppressionAssertion;
  v13 = -[_SBSystemApertureRepresentationSuppressionAssertion init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    -[_SBSystemApertureRepresentationSuppressionAssertion _setValid:](v13, "_setValid:", 1);
    v14->_coverSheetVisible = a3;
    v14->_liquidDetectionVisible = a4;
    v14->_proximityReaderVisible = a5;
    v14->_suppressForSystemChromeSuppression = a6;
    v15 = objc_msgSend(v12, "copy");
    invalidationBlock = v14->_invalidationBlock;
    v14->_invalidationBlock = (id)v15;

  }
  return v14;
}

- (void)_setValid:(BOOL)a3
{
  self->__valid = a3;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (-[_SBSystemApertureRepresentationSuppressionAssertion _isValid](self, "_isValid"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureViewController.m"), 4219, CFSTR("Must be invalidated before deallocation"));

  }
  v5.receiver = self;
  v5.super_class = (Class)_SBSystemApertureRepresentationSuppressionAssertion;
  -[_SBSystemApertureRepresentationSuppressionAssertion dealloc](&v5, sel_dealloc);
}

- (BOOL)_isValid
{
  return self->__valid;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_SBSystemApertureRepresentationSuppressionAssertion;
  -[_SBSystemApertureRepresentationSuppressionAssertion description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ coverSheetVisible: %{BOOL}u suppressForSystemChromeSuppression: %{BOOL}u"), v4, self->_coverSheetVisible, self->_suppressForSystemChromeSuppression);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

@end
