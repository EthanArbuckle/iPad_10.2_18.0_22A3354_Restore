@implementation PXSharedLibraryParticipantTableCellModel

- (PXSharedLibraryParticipantTableCellModel)init
{
  PXSharedLibraryParticipantTableCellModel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryParticipantTableCellModel;
  result = -[PXSharedLibraryParticipantTableCellModel init](&v3, sel_init);
  if (result)
  {
    result->_removeButtonVisible = 0;
    result->_ellipsisButtonAllowed = 0;
  }
  return result;
}

- (void)setImage:(id)a3
{
  UIImage *v4;
  char v5;
  UIImage *v6;
  UIImage *image;
  UIImage *v8;

  v8 = (UIImage *)a3;
  v4 = self->_image;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[UIImage isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (UIImage *)-[UIImage copy](v8, "copy");
      image = self->_image;
      self->_image = v6;

      -[PXSharedLibraryParticipantTableCellModel signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setRequestID:(int64_t)a3
{
  if (self->_requestID != a3)
  {
    self->_requestID = a3;
    -[PXSharedLibraryParticipantTableCellModel signalChange:](self, "signalChange:", 2);
  }
}

- (void)setName:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *name;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_name;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      name = self->_name;
      self->_name = v6;

      -[PXSharedLibraryParticipantTableCellModel signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)setAddress:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *address;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_address;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      address = self->_address;
      self->_address = v6;

      -[PXSharedLibraryParticipantTableCellModel signalChange:](self, "signalChange:", 8);
    }
  }

}

- (void)setEllipsisButtonAllowed:(BOOL)a3
{
  if (self->_ellipsisButtonAllowed != a3)
  {
    self->_ellipsisButtonAllowed = a3;
    -[PXSharedLibraryParticipantTableCellModel signalChange:](self, "signalChange:", 16);
  }
}

- (void)configureForParticipant:(id)a3 displayScale:(double)a4 isRTL:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a5;
  v8 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __87__PXSharedLibraryParticipantTableCellModel_configureForParticipant_displayScale_isRTL___block_invoke;
  v19[3] = &unk_1E5124C28;
  v19[4] = self;
  v19[5] = &v20;
  v10 = objc_msgSend(v8, "fetchImageForTargetSize:displayScale:isRTL:resultHandler:", v5, v19, 37.0, 37.0, a4);
  v21[3] = v10;
  objc_msgSend(v8, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appleIDAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __87__PXSharedLibraryParticipantTableCellModel_configureForParticipant_displayScale_isRTL___block_invoke_4;
  v15[3] = &unk_1E5124C50;
  v18 = &v20;
  v13 = v11;
  v16 = v13;
  v14 = v12;
  v17 = v14;
  -[PXSharedLibraryParticipantTableCellModel performChanges:](self, "performChanges:", v15);

  _Block_object_dispose(&v20, 8);
}

- (UIImage)image
{
  return self->_image;
}

- (int64_t)requestID
{
  return self->_requestID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)address
{
  return self->_address;
}

- (BOOL)removeButtonVisible
{
  return self->_removeButtonVisible;
}

- (BOOL)ellipsisButtonAllowed
{
  return self->_ellipsisButtonAllowed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

void __87__PXSharedLibraryParticipantTableCellModel_configureForParticipant_displayScale_isRTL___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  px_dispatch_on_main_queue();

}

void __87__PXSharedLibraryParticipantTableCellModel_configureForParticipant_displayScale_isRTL___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setRequestID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  objc_msgSend(v4, "setName:", *(_QWORD *)(a1 + 32));
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) != 0)
    v3 = 0;
  else
    v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "setAddress:", v3);
  objc_msgSend(v4, "setEllipsisButtonAllowed:", 1);

}

void __87__PXSharedLibraryParticipantTableCellModel_configureForParticipant_displayScale_isRTL___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "requestID") == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __87__PXSharedLibraryParticipantTableCellModel_configureForParticipant_displayScale_isRTL___block_invoke_3;
    v3[3] = &unk_1E5124C00;
    v2 = *(void **)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v2, "performChanges:", v3);

  }
}

uint64_t __87__PXSharedLibraryParticipantTableCellModel_configureForParticipant_displayScale_isRTL___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setImage:", *(_QWORD *)(a1 + 32));
}

+ (double)imageDiameter
{
  return 37.0;
}

+ (double)imageVerticalInset
{
  return 10.0;
}

+ (double)imageInset
{
  return 12.0;
}

@end
