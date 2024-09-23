@implementation TranscriptWaitingViewTextAttachmentViewProvider

- (void)loadView
{
  id v3;
  _TtC10VoiceMemos47TranscriptWaitingViewTextAttachmentViewProvider *v4;
  id v5;

  v3 = objc_allocWithZone((Class)type metadata accessor for TranscriptWaitingImageView());
  v4 = self;
  v5 = objc_msgSend(v3, "init");
  -[TranscriptWaitingViewTextAttachmentViewProvider setView:](v4, "setView:", v5);

}

- (_TtC10VoiceMemos47TranscriptWaitingViewTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6
{
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TranscriptWaitingViewTextAttachmentViewProvider();
  return -[TranscriptWaitingViewTextAttachmentViewProvider initWithTextAttachment:parentView:textLayoutManager:location:](&v11, "initWithTextAttachment:parentView:textLayoutManager:location:", a3, a4, a5, a6);
}

@end
