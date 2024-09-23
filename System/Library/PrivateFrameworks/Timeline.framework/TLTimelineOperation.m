@implementation TLTimelineOperation

- (TLTimelineOperation)initWithIdentifiable:(id)a3
{
  id v4;
  TLTimelineOperation *v5;
  uint64_t v6;
  TLIdentifiable *identifiable;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLTimelineOperation;
  v5 = -[TLOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copyWithZone:", 0);
    identifiable = v5->_identifiable;
    v5->_identifiable = (TLIdentifiable *)v6;

  }
  return v5;
}

- (TLIdentifiable)identifiable
{
  return self->_identifiable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiable, 0);
}

@end
