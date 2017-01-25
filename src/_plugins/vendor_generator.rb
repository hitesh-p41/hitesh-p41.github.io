module Jekyll
  class VendorGenerator < Generator
    safe true
    attr_accessor :site

    def generate(site)
    	@site = site
      generate_vendors
      ignore_to_rebuild
    end

    private
    def generate_vendors
    	puts "Coping vendors.."
      FileUtils.mkdir_p(destination_path)
      FileUtils.copy_entry(source_path, destination_path)
      puts "Vendor copied to build!"
    end

    def ignore_to_rebuild
    	site.keep_files << vendor_destination unless site.keep_files.include?(vendor_destination)
    end

    def source_path
    	Jekyll.sanitized_path(site.source, vendor_source)
    end

    def destination_path
    	Jekyll.sanitized_path(site.dest, vendor_destination)
    end

    def vendor_source
    	site.config["vendor"]["source"]
    end

    def vendor_destination
    	site.config["vendor"]["destination"]
    end
  end	
end
