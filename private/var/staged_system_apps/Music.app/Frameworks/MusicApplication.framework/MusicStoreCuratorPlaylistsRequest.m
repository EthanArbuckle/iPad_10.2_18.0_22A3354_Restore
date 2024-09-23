@implementation MusicStoreCuratorPlaylistsRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MusicStoreCuratorPlaylistsRequest)initWithCoder:(id)a3
{
  id v4;
  MusicStoreCuratorPlaylistsRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MusicStoreCuratorPlaylistsRequest;
  v5 = -[MusicStoreCuratorPlaylistsRequest initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5)
    v5->_curatorStoreAdamID = (int64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("MusicStoreCuratorPlaylistsRequestCuratorStoreAdamID"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MusicStoreCuratorPlaylistsRequest;
  v4 = a3;
  -[MusicStoreCuratorPlaylistsRequest encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_curatorStoreAdamID, CFSTR("MusicStoreCuratorPlaylistsRequestCuratorStoreAdamID"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MusicStoreCuratorPlaylistsRequest;
  result = -[MusicStoreCuratorPlaylistsRequest copyWithZone:](&v5, "copyWithZone:", a3);
  if (result)
    *((_QWORD *)result + 1) = self->_curatorStoreAdamID;
  return result;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MusicStoreCuratorPlaylistsRequestOperation *v5;
  id v6;
  MusicStoreCuratorPlaylistsRequestOperation *v7;

  v4 = a3;
  v5 = [MusicStoreCuratorPlaylistsRequestOperation alloc];
  v6 = -[MusicStoreCuratorPlaylistsRequest copy](self, "copy");
  v7 = -[MusicStoreCuratorPlaylistsRequestOperation initWithRequest:responseHandler:](v5, "initWithRequest:responseHandler:", v6, v4);

  return v7;
}

+ (id)allSupportedSectionProperties
{
  return +[MPStoreModelCuratorBuilder allSupportedProperties](MPStoreModelCuratorBuilder, "allSupportedProperties");
}

+ (id)allSupportedItemProperties
{
  return +[MPStoreModelPlaylistBuilder allSupportedProperties](MPStoreModelPlaylistBuilder, "allSupportedProperties");
}

- (int64_t)curatorStoreAdamID
{
  return self->_curatorStoreAdamID;
}

- (void)setCuratorStoreAdamID:(int64_t)a3
{
  self->_curatorStoreAdamID = a3;
}

- (MusicStoreCuratorPlaylistsResponse)previousResponse
{
  return self->_previousResponse;
}

- (void)setPreviousResponse:(id)a3
{
  objc_storeStrong((id *)&self->_previousResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousResponse, 0);
}

@end
