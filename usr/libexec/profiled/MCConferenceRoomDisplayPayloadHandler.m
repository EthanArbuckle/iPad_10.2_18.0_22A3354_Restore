@implementation MCConferenceRoomDisplayPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  -[MCConferenceRoomDisplayPayloadHandler _saveConferenceRoomDisplayConfiguration](self, "_saveConferenceRoomDisplayConfiguration", a3, a4, a5, a6);
  return 1;
}

- (void)remove
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if ((v4 & 1) == 0)
    -[MCConferenceRoomDisplayPayloadHandler _removeConferenceRoomDisplayConfiguration](self, "_removeConferenceRoomDisplayConfiguration");
}

- (void)setAside
{
  -[MCConferenceRoomDisplayPayloadHandler _removeConferenceRoomDisplayConfiguration](self, "_removeConferenceRoomDisplayConfiguration");
}

@end
