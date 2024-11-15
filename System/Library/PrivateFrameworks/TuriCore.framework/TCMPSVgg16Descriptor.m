@implementation TCMPSVgg16Descriptor

- (TCMPSVgg16Descriptor)init
{
  TCMPSVgg16Descriptor *v2;
  TCMPSVgg16Block1Descriptor *v3;
  TCMPSVgg16Block1Descriptor *block1;
  TCMPSVgg16Block1Descriptor *v5;
  TCMPSVgg16Block1Descriptor *block2;
  TCMPSVgg16Block2Descriptor *v7;
  TCMPSVgg16Block2Descriptor *block3;
  TCMPSVgg16Block2Descriptor *v9;
  TCMPSVgg16Block2Descriptor *block4;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TCMPSVgg16Descriptor;
  v2 = -[TCMPSVgg16Descriptor init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TCMPSVgg16Block1Descriptor);
    block1 = v2->_block1;
    v2->_block1 = v3;

    v5 = objc_alloc_init(TCMPSVgg16Block1Descriptor);
    block2 = v2->_block2;
    v2->_block2 = v5;

    v7 = objc_alloc_init(TCMPSVgg16Block2Descriptor);
    block3 = v2->_block3;
    v2->_block3 = v7;

    v9 = objc_alloc_init(TCMPSVgg16Block2Descriptor);
    block4 = v2->_block4;
    v2->_block4 = v9;

  }
  return v2;
}

- (TCMPSVgg16Block1Descriptor)block1
{
  return self->_block1;
}

- (void)setBlock1:(id)a3
{
  objc_storeStrong((id *)&self->_block1, a3);
}

- (TCMPSVgg16Block1Descriptor)block2
{
  return self->_block2;
}

- (void)setBlock2:(id)a3
{
  objc_storeStrong((id *)&self->_block2, a3);
}

- (TCMPSVgg16Block2Descriptor)block3
{
  return self->_block3;
}

- (void)setBlock3:(id)a3
{
  objc_storeStrong((id *)&self->_block3, a3);
}

- (TCMPSVgg16Block2Descriptor)block4
{
  return self->_block4;
}

- (void)setBlock4:(id)a3
{
  objc_storeStrong((id *)&self->_block4, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_block4, 0);
  objc_storeStrong((id *)&self->_block3, 0);
  objc_storeStrong((id *)&self->_block2, 0);
  objc_storeStrong((id *)&self->_block1, 0);
}

@end
