@implementation VGVertexAttributeBufferDump

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  IOSurface *iosurface;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[VGVertexAttributeBufferDump vertexFormat](self, "vertexFormat");
  NSStringFromSelector(sel_vertexFormat);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeInt:forKey:", v4, v5);

  v6 = -[VGVertexAttributeBufferDump elementCount](self, "elementCount");
  NSStringFromSelector(sel_elementCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeInt:forKey:", v6, v7);

  iosurface = self->_iosurface;
  NSStringFromSelector(sel_iosurface);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "vg_encodeSurface:forKey:", iosurface, v9);

}

- (VGVertexAttributeBufferDump)initWithCoder:(id)a3
{
  id v4;
  VGVertexAttributeBufferDump *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  IOSurface *iosurface;
  VGVertexAttributeBufferDump *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VGVertexAttributeBufferDump;
  v5 = -[VGVertexAttributeBufferDump init](&v13, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_vertexFormat);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_vertexFormat = (int)objc_msgSend(v4, "decodeIntForKey:", v6);

    NSStringFromSelector(sel_elementCount);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_elementCount = (int)objc_msgSend(v4, "decodeIntForKey:", v7);

    NSStringFromSelector(sel_iosurface);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vg_decodeSurfaceForKey:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    iosurface = v5->_iosurface;
    v5->_iosurface = (IOSurface *)v9;

    v11 = v5;
  }

  return v5;
}

- (unint64_t)numBytes
{
  uint64_t v2;

  v2 = 4;
  switch(self->_vertexFormat)
  {
    case 3uLL:
    case 6uLL:
    case 0x10uLL:
    case 0x19uLL:
    case 0x1CuLL:
    case 0x24uLL:
      return self->_elementCount * v2;
    case 0x11uLL:
    case 0x1AuLL:
      v2 = 6;
      break;
    case 0x12uLL:
    case 0x1BuLL:
    case 0x1DuLL:
    case 0x25uLL:
      v2 = 8;
      break;
    case 0x1EuLL:
    case 0x26uLL:
      v2 = 12;
      break;
    case 0x1FuLL:
    case 0x27uLL:
      v2 = 16;
      break;
    default:
      v2 = 0;
      break;
  }
  return self->_elementCount * v2;
}

- (unint64_t)vertexFormat
{
  return self->_vertexFormat;
}

- (void)setVertexFormat:(unint64_t)a3
{
  self->_vertexFormat = a3;
}

- (unint64_t)elementCount
{
  return self->_elementCount;
}

- (void)setElementCount:(unint64_t)a3
{
  self->_elementCount = a3;
}

- (IOSurface)iosurface
{
  return self->_iosurface;
}

- (void)setIosurface:(id)a3
{
  objc_storeStrong((id *)&self->_iosurface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iosurface, 0);
}

@end
