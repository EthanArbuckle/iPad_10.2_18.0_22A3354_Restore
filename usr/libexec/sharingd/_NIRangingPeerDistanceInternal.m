@implementation _NIRangingPeerDistanceInternal

- (_NIRangingPeerDistanceInternal)initWithPeer:(id)a3 distanceMeters:(id)a4 initiator:(BOOL)a5 shouldUnlock:(BOOL)a6
{
  _NIRangingPeer *v10;
  NSNumber *v11;
  _NIRangingPeerDistanceInternal *v12;
  _NIRangingPeerDistanceInternal *v13;
  _NIRangingPeer *v14;
  _NIRangingPeer *peer;
  NSNumber *v16;
  NSNumber *distanceMeters;
  _NIRangingPeerDistanceInternal *v18;
  objc_super v20;

  v10 = (_NIRangingPeer *)a3;
  v11 = (NSNumber *)a4;
  v20.receiver = self;
  v20.super_class = (Class)_NIRangingPeerDistanceInternal;
  v12 = -[_NIRangingPeerDistanceInternal init](&v20, "init");
  v13 = v12;
  if (v12)
  {
    if (v12->_peer != v10)
    {
      v14 = (_NIRangingPeer *)-[_NIRangingPeer copy](v10, "copy");
      peer = v13->_peer;
      v13->_peer = v14;

    }
    if (v13->_distanceMeters != v11)
    {
      v16 = (NSNumber *)-[NSNumber copy](v11, "copy");
      distanceMeters = v13->_distanceMeters;
      v13->_distanceMeters = v16;

    }
    v13->_initiator = a5;
    v13->_shouldUnlock = a6;
    v18 = v13;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithPeer:distanceMeters:initiator:shouldUnlock:", self->_peer, self->_distanceMeters, self->_initiator, self->_shouldUnlock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceMeters, 0);
  objc_storeStrong((id *)&self->_peer, 0);
}

@end
