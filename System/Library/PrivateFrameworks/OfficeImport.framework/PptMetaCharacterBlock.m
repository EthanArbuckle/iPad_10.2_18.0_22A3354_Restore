@implementation PptMetaCharacterBlock

- (PptMetaCharacterBlock)initWithType:(int)a3 position:(int)a4
{
  return -[PptMetaCharacterBlock initWithType:position:extraData:](self, "initWithType:position:extraData:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0);
}

- (int)position
{
  return self->mPosition;
}

- (int)type
{
  return self->mType;
}

- (PptMetaCharacterBlock)initWithType:(int)a3 position:(int)a4 extraData:(int)a5
{
  PptMetaCharacterBlock *result;
  int v9;
  _DWORD *exception;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PptMetaCharacterBlock;
  result = -[PptMetaCharacterBlock init](&v11, sel_init);
  if (result)
  {
    v9 = 0;
    switch(a3)
    {
      case 4087:
        v9 = 2;
        break;
      case 4088:
        v9 = 1;
        break;
      case 4089:
        v9 = 3;
        break;
      case 4090:
        break;
      default:
        if (a3 != 4056)
        {
          exception = __cxa_allocate_exception(4uLL);
          *exception = 1000;
        }
        v9 = 4;
        break;
    }
    result->mType = v9;
    result->mPosition = a4;
    result->mExtraData = a5;
  }
  return result;
}

- (void)setPosition:(int)a3
{
  self->mPosition = a3;
}

- (int)extraData
{
  return self->mExtraData;
}

@end
