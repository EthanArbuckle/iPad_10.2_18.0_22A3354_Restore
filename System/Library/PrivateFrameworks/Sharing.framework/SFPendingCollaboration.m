@implementation SFPendingCollaboration

- (SFCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationMetadata, 0);
}

@end
