@implementation RBImageQueueLayer

+ (id)defaultValueForKey:(id)a3
{
  objc_super v6;
  _QWORD v7[2];

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("speed")) & 1) != 0)
    return &unk_24C235078;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("anchorPoint")))
  {
    v7[0] = 0;
    v7[1] = 0;
    return (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v7, "{CGPoint=dd}");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("needsLayoutOnGeometryChange")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("allowsEdgeAntialiasing")) & 1) != 0)
  {
    return (id)MEMORY[0x24BDBD1C0];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___RBImageQueueLayer;
    return objc_msgSendSuper2(&v6, sel_defaultValueForKey_, a3);
  }
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (id)initWithSlots:(void *)a1
{
  id *v1;
  _QWORD *v2;
  objc_super v4;

  if (!a1)
    return 0;
  v4.receiver = a1;
  v4.super_class = (Class)RBImageQueueLayer;
  v1 = (id *)objc_msgSendSuper2(&v4, sel_init);
  if (v1)
  {
    v2 = -[RBImageQueueContents initWithSlots:]([RBImageQueueContents alloc]);

    v1[4] = v2;
    objc_msgSend(v1, "setContents:", v1[4]);
    objc_msgSend(v1, "setContentsGravity:", *MEMORY[0x24BDE5C68]);
  }
  return v1;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

- (void).cxx_destruct
{

}

@end
