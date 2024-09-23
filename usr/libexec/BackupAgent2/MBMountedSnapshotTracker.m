@implementation MBMountedSnapshotTracker

- (MBMountedSnapshotTracker)init
{
  MBMountedSnapshotTracker *v2;
  NSMutableArray *v3;
  NSMutableArray *mountedSnapshots;
  NSMutableDictionary *v5;
  NSMutableDictionary *snapshotMountPointsByVolume;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MBMountedSnapshotTracker;
  v2 = -[MBMountedSnapshotTracker init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableArray);
    mountedSnapshots = v2->_mountedSnapshots;
    v2->_mountedSnapshots = v3;

    v5 = objc_opt_new(NSMutableDictionary);
    snapshotMountPointsByVolume = v2->_snapshotMountPointsByVolume;
    v2->_snapshotMountPointsByVolume = v5;

  }
  return v2;
}

- (void)trackSnapshotForVolume:(id)a3 snapshotName:(id)a4 mountPount:(id)a5
{
  id v8;
  id v9;
  MBMountedSnapshotRecord *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_new(MBMountedSnapshotRecord);
  -[MBMountedSnapshotRecord setSnapshotName:](v10, "setSnapshotName:", v8);
  -[MBMountedSnapshotRecord setVolumeMountPoint:](v10, "setVolumeMountPoint:", v11);
  -[MBMountedSnapshotRecord setSnapshotMountPoint:](v10, "setSnapshotMountPoint:", v9);
  -[NSMutableArray addObject:](self->_mountedSnapshots, "addObject:", v10);
  if (objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_snapshotMountPointsByVolume, "objectForKeyedSubscript:", v11)))
  {
    sub_100088C10();
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_snapshotMountPointsByVolume, "setObject:forKeyedSubscript:", v9, v11);

}

- (id)snapshotMountPointForVolumeMountPoint:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_snapshotMountPointsByVolume, "objectForKeyedSubscript:", a3);
}

- (NSArray)mountedSnapshots
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotMountPointsByVolume, 0);
  objc_storeStrong((id *)&self->_mountedSnapshots, 0);
}

@end
