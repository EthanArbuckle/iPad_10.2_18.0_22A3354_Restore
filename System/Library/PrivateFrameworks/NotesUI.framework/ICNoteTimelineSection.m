@implementation ICNoteTimelineSection

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (ICNoteTimelineSectionIdentifier)identifier
{
  return self->_identifier;
}

- (ICNoteTimelineSection)initWithIdentifier:(id)a3 objectIDs:(id)a4
{
  id v6;
  id v7;
  ICNoteTimelineSection *v8;
  ICNoteTimelineSection *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICNoteTimelineSection;
  v8 = -[ICNoteTimelineSection init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ICNoteTimelineSection setIdentifier:](v8, "setIdentifier:", v6);
    v10 = (void *)objc_msgSend(v7, "copy");
    -[ICNoteTimelineSection setObjectIDs:](v9, "setObjectIDs:", v10);

  }
  return v9;
}

- (void)setObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDs, a3);
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
