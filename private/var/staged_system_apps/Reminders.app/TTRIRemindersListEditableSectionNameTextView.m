@implementation TTRIRemindersListEditableSectionNameTextView

- (BOOL)canBecomeFocused
{
  return -[TTRIRemindersListEditableSectionNameTextView isEditing](self, "isEditing");
}

- (_TtC9Reminders44TTRIRemindersListEditableSectionNameTextView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRIRemindersListEditableSectionNameTextView();
  return -[TTRIRemindersListEditableSectionNameTextView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
