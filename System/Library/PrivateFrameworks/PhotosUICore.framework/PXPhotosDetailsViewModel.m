@implementation PXPhotosDetailsViewModel

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsViewModel;
  -[PXPhotosDetailsViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setSelecting:(BOOL)a3
{
  if (self->_selecting != a3)
  {
    self->_selecting = a3;
    if (!a3)
      -[PXPhotosDetailsViewModel setFaceModeEnabled:](self, "setFaceModeEnabled:", 0);
    -[PXPhotosDetailsViewModel signalChange:](self, "signalChange:", 1);
  }
}

- (void)setSupportsSelection:(BOOL)a3
{
  if (self->_supportsSelection != a3)
  {
    self->_supportsSelection = a3;
    -[PXPhotosDetailsViewModel signalChange:](self, "signalChange:", 2);
  }
}

- (void)setSelectionManager:(id)a3
{
  PXSectionedSelectionManager *v5;
  PXSectionedSelectionManager *v6;

  v5 = (PXSectionedSelectionManager *)a3;
  if (self->_selectionManager != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectionManager, a3);
    -[PXPhotosDetailsViewModel signalChange:](self, "signalChange:", 4);
    v5 = v6;
  }

}

- (void)setSupportsFaceMode:(BOOL)a3
{
  if (self->_supportsFaceMode != a3)
  {
    self->_supportsFaceMode = a3;
    -[PXPhotosDetailsViewModel signalChange:](self, "signalChange:", 8);
  }
}

- (void)setFaceModeEnabled:(BOOL)a3
{
  if (self->_faceModeEnabled != a3)
  {
    self->_faceModeEnabled = a3;
    -[PXPhotosDetailsViewModel signalChange:](self, "signalChange:", 16);
  }
}

- (void)setDisabledActionTypes:(id)a3
{
  NSSet *v5;
  NSSet *v6;
  char v7;
  NSSet *v8;

  v8 = (NSSet *)a3;
  v5 = self->_disabledActionTypes;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSSet isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_disabledActionTypes, a3);
      -[PXPhotosDetailsViewModel signalChange:](self, "signalChange:", 32);
    }
  }

}

- (BOOL)isSelecting
{
  return self->_selecting;
}

- (BOOL)supportsSelection
{
  return self->_supportsSelection;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (BOOL)supportsFaceMode
{
  return self->_supportsFaceMode;
}

- (BOOL)isFaceModeEnabled
{
  return self->_faceModeEnabled;
}

- (NSSet)disabledActionTypes
{
  return self->_disabledActionTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledActionTypes, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
}

@end
