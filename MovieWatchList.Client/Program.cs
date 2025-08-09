using Microsoft.AspNetCore.Components.WebAssembly.Hosting;

var builder = WebAssemblyHostBuilder.CreateDefault(args);

// Load appsettings.Client.json explicitly
builder.Configuration.AddJsonFile("appsettings.Client.json", optional: true, reloadOnChange: true);

await builder.Build().RunAsync();
