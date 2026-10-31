mob
    verb
        SpawnObject()
            set name = "Spawn Object"
            set category = "Debug"

            var/list/object_types = typesof(/obj)
            object_types -= /obj

            var/object_type = input(
                src,
                "Choose an object to spawn.",
                "Spawn Object"
            ) as null|anything in object_types

            if(!object_type)
                return

            var/atom/location = src.loc

            while(location && !isturf(location))
                location = location.loc

            if(!location)
                src << "You must be on the map to spawn an object."
                return

            new object_type(location)

            src << "Spawned [object_type]."