# toolkit.nu - helper commands for koreader dev

const current_dir = path self .

export def "kindle copy-changed" [] {
    git diff --name-only | lines | each {|f|
        let dst = '/Volumes/Kindle/koreader' | path join $f
        print $"($dst) updated"
        cp -r $f $dst
    } | ignore
}

export def "kindle copy-staged" [] {
    git diff --cached --name-only | lines | each {|f|
        let dst = '/Volumes/Kindle/koreader' | path join $f
        print $"($dst) updated"
        cp $f $dst
    } | ignore
}

export def "kindle eject" [] {
    ^diskutil eject /Volumes/Kindle
}
