@implementation TUIRenderModelIdentifierConfiguration

- (TUIRenderModelIdentifierConfiguration)init
{
  TUIRenderModelIdentifierConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIRenderModelIdentifierConfiguration;
  result = -[TUIRenderModelIdentifierConfiguration init](&v3, "init");
  if (result)
    result->_reservedViews = 0;
  return result;
}

- (TUIRenderModelIdentifierConfiguration)initWithOther:(id)a3
{
  _QWORD *v4;
  TUIRenderModelIdentifierConfiguration *v5;
  TUIRenderModelIdentifierConfiguration *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIRenderModelIdentifierConfiguration;
  v5 = -[TUIRenderModelIdentifierConfiguration init](&v8, "init");
  v6 = v5;
  if (v5)
    v5->_reservedViews = v4[1];

  return v6;
}

- (unint64_t)reservedViews
{
  return self->_reservedViews;
}

- (void)setReservedViews:(unint64_t)a3
{
  self->_reservedViews = a3;
}

@end
