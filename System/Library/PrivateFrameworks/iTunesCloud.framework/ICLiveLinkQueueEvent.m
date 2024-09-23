@implementation ICLiveLinkQueueEvent

- (id)description
{
  int64_t kind;
  uint64_t v4;

  kind = self->_kind;
  switch(kind)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkQueueEvent: %p unknown/invalid>"), self, v4);
      break;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkQueueEvent: %p contentAdded=%@"), self, self->_contentAdded);
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkQueueEvent: %p contentRemoved=%@"), self, self->_contentRemoved);
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkQueueEvent: %p contentReordered=%@"), self, self->_contentReordered);
      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkQueueEvent: %p playbackModeChanged=%@"), self, self->_playbackModeChanged);
      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkQueueEvent: %p contentReplaced=%@"), self, self->_contentReplaced);
      break;
    case 6:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkQueueEvent: %p contentPlayedNow=%@"), self, self->_contentPlayedNow);
      break;
    case 7:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkQueueEvent: %p contentUpdatedMessage=%@"), self, self->_contentUpdatedMessage);
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkQueueEvent: %p unknown/eventKind=%ld"), self, kind);
      break;
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)kind
{
  return self->_kind;
}

- (ICLiveLinkQueueEventContentAdded)contentAdded
{
  return self->_contentAdded;
}

- (ICLiveLinkQueueEventContentPlayedNow)contentPlayedNow
{
  return self->_contentPlayedNow;
}

- (ICLiveLinkQueueEventContentRemoved)contentRemoved
{
  return self->_contentRemoved;
}

- (ICLiveLinkQueueEventContentReordered)contentReordered
{
  return self->_contentReordered;
}

- (ICLiveLinkQueueEventContentReplaced)contentReplaced
{
  return self->_contentReplaced;
}

- (ICLiveLinkQueueEventContentUpdatedMessage)contentUpdatedMessage
{
  return self->_contentUpdatedMessage;
}

- (ICLiveLinkQueueEventPlaybackModeChanged)playbackModeChanged
{
  return self->_playbackModeChanged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackModeChanged, 0);
  objc_storeStrong((id *)&self->_contentUpdatedMessage, 0);
  objc_storeStrong((id *)&self->_contentReplaced, 0);
  objc_storeStrong((id *)&self->_contentReordered, 0);
  objc_storeStrong((id *)&self->_contentRemoved, 0);
  objc_storeStrong((id *)&self->_contentPlayedNow, 0);
  objc_storeStrong((id *)&self->_contentAdded, 0);
}

+ (ICLiveLinkQueueEvent)queueEventWithContentAdded:(id)a3
{
  ICLiveLinkQueueEventContentAdded *v3;
  ICLiveLinkQueueEvent *v4;
  ICLiveLinkQueueEventContentAdded *contentAdded;

  v3 = (ICLiveLinkQueueEventContentAdded *)a3;
  v4 = objc_alloc_init(ICLiveLinkQueueEvent);
  contentAdded = v4->_contentAdded;
  v4->_kind = 1;
  v4->_contentAdded = v3;

  return v4;
}

+ (ICLiveLinkQueueEvent)queueEventWithContentPlayedNow:(id)a3
{
  ICLiveLinkQueueEventContentPlayedNow *v3;
  ICLiveLinkQueueEvent *v4;
  ICLiveLinkQueueEventContentPlayedNow *contentPlayedNow;

  v3 = (ICLiveLinkQueueEventContentPlayedNow *)a3;
  v4 = objc_alloc_init(ICLiveLinkQueueEvent);
  v4->_kind = 6;
  contentPlayedNow = v4->_contentPlayedNow;
  v4->_contentPlayedNow = v3;

  return v4;
}

+ (ICLiveLinkQueueEvent)queueEventWithContentRemoved:(id)a3
{
  ICLiveLinkQueueEventContentRemoved *v3;
  ICLiveLinkQueueEvent *v4;
  ICLiveLinkQueueEventContentRemoved *contentRemoved;

  v3 = (ICLiveLinkQueueEventContentRemoved *)a3;
  v4 = objc_alloc_init(ICLiveLinkQueueEvent);
  v4->_kind = 2;
  contentRemoved = v4->_contentRemoved;
  v4->_contentRemoved = v3;

  return v4;
}

+ (ICLiveLinkQueueEvent)queueEventWithContentReordered:(id)a3
{
  ICLiveLinkQueueEventContentReordered *v3;
  ICLiveLinkQueueEvent *v4;
  ICLiveLinkQueueEventContentReordered *contentReordered;

  v3 = (ICLiveLinkQueueEventContentReordered *)a3;
  v4 = objc_alloc_init(ICLiveLinkQueueEvent);
  v4->_kind = 3;
  contentReordered = v4->_contentReordered;
  v4->_contentReordered = v3;

  return v4;
}

+ (ICLiveLinkQueueEvent)queueEventWithContentReplaced:(id)a3
{
  ICLiveLinkQueueEventContentReplaced *v3;
  ICLiveLinkQueueEvent *v4;
  ICLiveLinkQueueEventContentReplaced *contentReplaced;

  v3 = (ICLiveLinkQueueEventContentReplaced *)a3;
  v4 = objc_alloc_init(ICLiveLinkQueueEvent);
  v4->_kind = 5;
  contentReplaced = v4->_contentReplaced;
  v4->_contentReplaced = v3;

  return v4;
}

+ (ICLiveLinkQueueEvent)queueEventWithContentUpdatedMessage:(id)a3
{
  ICLiveLinkQueueEventContentUpdatedMessage *v3;
  ICLiveLinkQueueEvent *v4;
  ICLiveLinkQueueEventContentUpdatedMessage *contentUpdatedMessage;

  v3 = (ICLiveLinkQueueEventContentUpdatedMessage *)a3;
  v4 = objc_alloc_init(ICLiveLinkQueueEvent);
  v4->_kind = 7;
  contentUpdatedMessage = v4->_contentUpdatedMessage;
  v4->_contentUpdatedMessage = v3;

  return v4;
}

+ (ICLiveLinkQueueEvent)queueEventWithPlaybackModeChanged:(id)a3
{
  ICLiveLinkQueueEventPlaybackModeChanged *v3;
  ICLiveLinkQueueEvent *v4;
  ICLiveLinkQueueEventPlaybackModeChanged *playbackModeChanged;

  v3 = (ICLiveLinkQueueEventPlaybackModeChanged *)a3;
  v4 = objc_alloc_init(ICLiveLinkQueueEvent);
  v4->_kind = 4;
  playbackModeChanged = v4->_playbackModeChanged;
  v4->_playbackModeChanged = v3;

  return v4;
}

@end
