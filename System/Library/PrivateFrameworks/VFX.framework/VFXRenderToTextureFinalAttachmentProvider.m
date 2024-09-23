@implementation VFXRenderToTextureFinalAttachmentProvider

- (VFXRenderToTextureFinalAttachmentProvider)initWithTexture:(id)a3
{
  VFXRenderToTextureFinalAttachmentProvider *v4;
  CFX::RG::ResourceIdentifier *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)VFXRenderToTextureFinalAttachmentProvider;
  v4 = -[VFXRenderToTextureFinalAttachmentProvider init](&v25, sel_init);
  if (v4)
  {
    v5 = (CFX::RG::ResourceIdentifier *)a3;
    v4->_texture = v5;
    v4->_finalAttachementIdentifier = RGResourceIdentifierFinalColor(v5);
    v4->_drawableDescriptor = objc_alloc_init(VFXDrawableDescriptor);
    v9 = objc_msgSend_width(v4->_texture, v6, v7, v8);
    objc_msgSend_setWidth_(v4->_drawableDescriptor, v10, v9, v11);
    v15 = objc_msgSend_height(v4->_texture, v12, v13, v14);
    objc_msgSend_setHeight_(v4->_drawableDescriptor, v16, v15, v17);
    v21 = objc_msgSend_pixelFormat(v4->_texture, v18, v19, v20);
    objc_msgSend_setPixelFormat_(v4->_drawableDescriptor, v22, v21, v23);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXRenderToTextureFinalAttachmentProvider;
  -[VFXRenderToTextureFinalAttachmentProvider dealloc](&v3, sel_dealloc);
}

- (VFXDrawableDescriptor)drawableDescriptor
{
  return self->_drawableDescriptor;
}

- (id)textureForAttachment:(id)a3 withDescriptor:(id)a4
{
  unint64_t finalAttachementIdentifier;
  uint64_t v6;

  finalAttachementIdentifier = self->_finalAttachementIdentifier;
  v6 = RGResourceIdentifierMake((NSString *)a3);
  if (RGResourceIdentifierMatch(finalAttachementIdentifier, v6))
    return self->_texture;
  else
    return 0;
}

@end
