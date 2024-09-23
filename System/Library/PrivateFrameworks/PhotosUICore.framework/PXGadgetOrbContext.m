@implementation PXGadgetOrbContext

- (PXGadget)gadget
{
  return self->_gadget;
}

- (void)setGadget:(id)a3
{
  objc_storeStrong((id *)&self->_gadget, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gadget, 0);
}

@end
