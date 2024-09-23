@implementation NoteUserActivityState

- (NoteUserActivityState)initWithNote:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NoteUserActivityState;
  return -[NoteUserActivityState initWithNote:](&v4, "initWithNote:", a3);
}

- (void)updateUserActivity:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NoteUserActivityState;
  v4 = a3;
  -[NoteUserActivityState updateUserActivity:](&v5, "updateUserActivity:", v4);
  sub_10005CF3C(v4, self);

}

- (NSString)noteID
{
  return self->_noteID;
}

- (void)setNoteID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)contentHash
{
  return self->_contentHash;
}

- (void)setContentHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isContentPlainText
{
  return self->_contentPlainText;
}

- (void)setContentPlainText:(BOOL)a3
{
  self->_contentPlainText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentHash, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_noteID, 0);
}

@end
