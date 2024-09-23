@implementation ICSharedTracklistPosition

- (int64_t)type
{
  return self->_type;
}

- (NSString)afterItemIdentifier
{
  return self->_afterItemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_afterItemIdentifier, 0);
}

+ (id)specifiedPositionAfterItemIdentifier:(id)a3
{
  id v3;
  ICSharedTracklistPosition *v4;
  uint64_t v5;
  NSString *afterItemIdentifier;

  v3 = a3;
  v4 = objc_alloc_init(ICSharedTracklistPosition);
  v4->_type = 0;
  v5 = objc_msgSend(v3, "copy");

  afterItemIdentifier = v4->_afterItemIdentifier;
  v4->_afterItemIdentifier = (NSString *)v5;

  return v4;
}

+ (id)playNextPositionWithAfterItemIdentifierHint:(id)a3
{
  id v3;
  ICSharedTracklistPosition *v4;
  uint64_t v5;
  NSString *afterItemIdentifier;

  v3 = a3;
  v4 = objc_alloc_init(ICSharedTracklistPosition);
  v4->_type = 1;
  v5 = objc_msgSend(v3, "copy");

  afterItemIdentifier = v4->_afterItemIdentifier;
  v4->_afterItemIdentifier = (NSString *)v5;

  return v4;
}

+ (id)playLastPositionWithAfterItemIdentifierHint:(id)a3
{
  id v3;
  ICSharedTracklistPosition *v4;
  uint64_t v5;
  NSString *afterItemIdentifier;

  v3 = a3;
  v4 = objc_alloc_init(ICSharedTracklistPosition);
  v4->_type = 2;
  v5 = objc_msgSend(v3, "copy");

  afterItemIdentifier = v4->_afterItemIdentifier;
  v4->_afterItemIdentifier = (NSString *)v5;

  return v4;
}

@end
