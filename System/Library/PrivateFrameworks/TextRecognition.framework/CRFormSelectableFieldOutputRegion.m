@implementation CRFormSelectableFieldOutputRegion

- (CRFormSelectableFieldOutputRegion)initWithQuad:(id)a3 type:(unint64_t)a4 labelRegion:(id)a5 source:(unint64_t)a6
{
  CRFormSelectableFieldOutputRegion *v7;
  CRFormSelectableFieldOutputRegion *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRFormSelectableFieldOutputRegion;
  v7 = -[CRFormFieldOutputRegion initWithQuad:labelRegion:subFields:source:](&v10, sel_initWithQuad_labelRegion_subFields_source_, a3, a5, 0, a6);
  v8 = v7;
  if (v7)
  {
    v7->_selectableFieldType = a4;
    -[CRFormFieldOutputRegion setHasBoundedWidth:](v7, "setHasBoundedWidth:", 1);
    -[CRFormFieldOutputRegion setHasBoundedHeight:](v8, "setHasBoundedHeight:", 1);
  }
  return v8;
}

- (unint64_t)fieldType
{
  return 2;
}

- (void)setSelectableFieldType:(unint64_t)a3
{
  self->_selectableFieldType = a3;
}

- (CRFormSelectableFieldOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8;
  CRFormSelectableFieldOutputRegion *v9;
  objc_super v11;

  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRFormSelectableFieldOutputRegion;
  v9 = -[CRFormFieldOutputRegion initWithCRCodableDataRepresentation:version:offset:](&v11, sel_initWithCRCodableDataRepresentation_version_offset_, v8, a4, a5);
  if (v9)
    v9->_selectableFieldType = +[CRCodingUtilities unsignedIntegerFromEncodingData:offset:](CRCodingUtilities, "unsignedIntegerFromEncodingData:offset:", v8, a5);

  return v9;
}

- (id)crCodableDataRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0C99DF0];
  v7.receiver = self;
  v7.super_class = (Class)CRFormSelectableFieldOutputRegion;
  -[CRFormFieldOutputRegion crCodableDataRepresentation](&v7, sel_crCodableDataRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CRCodingUtilities appendUInteger:toData:](CRCodingUtilities, "appendUInteger:toData:", self->_selectableFieldType, v5);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRFormSelectableFieldOutputRegion;
  v7 = -[CRFormFieldOutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](&v9, sel_copyWithZone_copyChildren_copyCandidates_deepCopy_, a3, a4, a5, a6);
  objc_msgSend(v7, "setSelectableFieldType:", -[CRFormSelectableFieldOutputRegion selectableFieldType](self, "selectableFieldType"));
  return v7;
}

- (unint64_t)selectableFieldType
{
  return self->_selectableFieldType;
}

@end
