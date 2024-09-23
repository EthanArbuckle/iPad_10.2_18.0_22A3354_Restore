@implementation PRSWallpaperClient

- (void)initializeWithKnownIdentities:(id)a3 knownRoles:(id)a4 knownCollection:(id)a5
{
  PRSWallpaperPublisher **p_publisher;
  id v9;
  id v10;
  id v11;
  id WeakRetained;

  p_publisher = &self->_publisher;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_publisher);
  objc_msgSend(WeakRetained, "_initializeClient:withKnownIdentities:knownRoles:knownCollection:", self, v11, v10, v9);

}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_posterCollectionChangesRole, 0);
  objc_storeStrong((id *)&self->_lastKnownPosterCollection, 0);
  objc_storeStrong((id *)&self->_activePosterObservedRoles, 0);
  for (i = 64; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_publisher);
}

@end
